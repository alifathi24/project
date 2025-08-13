# app.py
import os
from typing import List, Optional
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import csv
from datetime import datetime

# ====== Optional: OpenAI (recommended for MVP quality) ======
USE_OPENAI = bool(os.getenv("OPENAI_API_KEY"))

if USE_OPENAI:
    from openai import OpenAI
    oai_client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

app = FastAPI(title="Quiz Generator MVP")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class GenerateRequest(BaseModel):
    topic: Optional[str] = None
    text: Optional[str] = None
    n_questions: int = 5

class MCQ(BaseModel):
    question: str
    correct_answer: str
    incorrect_answers: List[str]

class GenerateResponse(BaseModel):
    items: List[MCQ]

class WaitlistEntry(BaseModel):
    name: str
    email: str
    role: Optional[str] = None  # student, teacher, admin
    notes: Optional[str] = None

PROMPT_TEMPLATE = """
You are an expert instructional designer.
Generate {n} high-quality multiple-choice questions about the given material.
Each question must include:
- A clear question stem.
- Exactly 1 correct answer.
- Exactly 3 plausible but incorrect distractors.

Return ONLY valid JSON as an array under key "items" where each item has fields:
- question (string)
- correct_answer (string)
- incorrect_answers (array of exactly 3 strings)

Material (use topic and/or text):
TOPIC: "{topic}"
TEXT:\n"""
"""{text}"""
"""

@app.post("/generate", response_model=GenerateResponse)
async def generate_quiz(req: GenerateRequest):
    if not req.topic and not req.text:
        raise HTTPException(status_code=400, detail="Provide 'topic' or 'text'.")

    topic = req.topic or ""
    text = (req.text or "")[:8000]  # keep prompt bounded
    n = max(1, min(req.n_questions, 10))

    if not USE_OPENAI:
        # Lightweight fallback: deterministic templating (good for demo when no API key)
        # NOTE: This is not AI-generated; it's a basic placeholder so the UI still works.
        base_q = f"Which statement about {topic or 'the topic'} is true?"
        items = []
        for i in range(n):
            items.append(MCQ(
                question=f"{base_q} ({i+1})",
                correct_answer="The accurate statement.",
                incorrect_answers=["A common misconception.", "An unrelated fact.", "An exaggerated claim."]
            ))
        return GenerateResponse(items=items)

    prompt = PROMPT_TEMPLATE.format(n=n, topic=topic, text=text)

    try:
        completion = oai_client.chat.completions.create(
            model="gpt-4o-mini",
            messages=[
                {"role": "system", "content": "You return strict JSON and nothing else."},
                {"role": "user", "content": prompt}
            ],
            temperature=0.5,
        )
        content = completion.choices[0].message.content
        import json
        data = json.loads(content)
        # Basic validation
        items = [MCQ(**item) for item in data["items"]]
        return GenerateResponse(items=items)
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Generation failed: {e}")

WAITLIST_CSV = os.getenv("WAITLIST_CSV", "waitlist.csv")

@app.post("/waitlist")
async def join_waitlist(entry: WaitlistEntry):
    # naive CSV append (sufficient for MVP). In production, use a DB.
    new_file = not os.path.exists(WAITLIST_CSV)
    with open(WAITLIST_CSV, "a", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        if new_file:
            writer.writerow(["timestamp", "name", "email", "role", "notes"])  # header
        writer.writerow([
            datetime.utcnow().isoformat(),
            entry.name,
            entry.email,
            entry.role or "",
            (entry.notes or "").replace("\n", " ")
        ])
    return {"ok": True}

@app.get("/")
async def root():
    return {"status": "ok"}