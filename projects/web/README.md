jobbot.com/
├── README.md // Project overview, setup instructions, etc.
├── .gitignore // Files/folders to ignore in Git
├── package.json // Node.js project metadata and dependencies (if using Node.js for frontend/backend)
├── package-lock.json // (or yarn.lock)
├── .env.example // Example environment variables
├── .vscode/ // VS Code specific settings (optional)
│ └── settings.json
├── docs/ // Project documentation (API docs, design docs, etc.)
│ └── architecture.md
│ └── api-endpoints.md
│ └── ...
├── frontend/ // All front-end related code
│ ├── public/ // Static assets that are served directly (e.g., index.html, favicon)
│ │ ├── index.html
│ │ ├── favicon.ico
│ │ └── images/
│ │ └── logo.png
│ │ └── ...
│ ├── src/ // Source code for the front-end application
│ │ ├── assets/ // Static assets that are processed by the build system (e.g., images, fonts, icons)
│ │ │ ├── images/
│ │ │ ├── fonts/
│ │ │ └── icons/
│ │ ├── components/ // Reusable UI components (buttons, cards, modals, forms)
│ │ │ ├── Button/
│ │ │ │ └── Button.js
│ │ │ │ └── Button.module.css
│ │ │ ├── Card/
│ │ │ │ └── Card.js
│ │ │ └── ...
│ │ ├── pages/ // Page-level components (each representing a different route/view)
│ │ │ ├── LandingPage/
│ │ │ │ └── LandingPage.js
│ │ │ │ └── LandingPage.module.css
│ │ │ ├── Dashboard/
│ │ │ │ └── Dashboard.js
│ │ │ ├── JobSearch/
│ │ │ │ └── JobSearch.js
│ │ │ └── ...
│ │ ├── services/ // API calls, external service integrations
│ │ │ ├── authService.js
│ │ │ ├── jobService.js
│ │ │ └── ...
│ │ ├── utils/ // Utility functions, helpers (e.g., date formatting, validation)
│ │ │ └── helpers.js
│ │ │ └── validators.js
│ │ ├── hooks/ // Custom React hooks (if using React)
│ │ │ └── useAuth.js
│ │ ├── store/ // State management (e.g., Redux, Zustand, Context API)
│ │ │ ├── index.js
│ │ │ ├── reducers/
│ │ │ └── actions/
│ │ ├── styles/ // Global styles, themes, variables
│ │ │ ├── global.css
│ │ │ └── variables.css
│ │ ├── App.js // Main application component
│ │ └── index.js // Entry point for the frontend
│ └── package.json // Frontend dependencies (e.g., React, Next.js, Vue, Angular)
│ └── ... // Other frontend config files (e.g., webpack.config.js, next.config.js)
│
├── backend/ // All back-end related code
│ ├── src/ // Source code for the backend application
│ │ ├── controllers/ // Handle incoming requests and send responses
│ │ │ ├── authController.js
│ │ │ ├── jobController.js
│ │ │ └── ...
│ │ ├── models/ // Database schemas/models
│ │ │ ├── User.js
│ │ │ ├── Resume.js
│ │ │ ├── Application.js
│ │ │ └── ...
│ │ ├── routes/ // Define API endpoints
│ │ │ ├── authRoutes.js
│ │ │ ├── jobRoutes.js
│ │ │ └── ...
│ │ ├── services/ // Business logic, interact with models and external APIs
│ │ │ ├── userService.js
│ │ │ ├── resumeService.js
│ │ │ ├── jobApplicationService.js
│ │ │ ├── aiIntegrationService.js // For AI integration
│ │ │ └── ...
│ │ ├── utils/ // Utility functions (e.g., error handling, validators, email senders)
│ │ │ ├── errorHandler.js
│ │ │ ├── jwt.js
│ │ │ └── ...
│ │ ├── config/ // Configuration files (database, external APIs, etc.)
│ │ │ ├── database.js
│ │ │ └── keys.js
│ │ ├── middlewares/ // Express middleware (authentication, logging)
│ │ │ └── authMiddleware.js
│ │ ├── app.js // Main entry point for the backend (e.g., Express app)
│ │ └── server.js // Server setup and listening
│ ├── tests/ // Backend tests
│ │ └── unit/
│ │ └── integration/
│ ├── .env.example // Example backend environment variables
│ ├── package.json // Backend dependencies (e.g., Express, Mongoose, Passport)
│ └── ... // Other backend config files (e.g., Dockerfile, pm2.config.js)
│
├── ai_models/ // Directory for AI models and related scripts
│ ├── resume_parser/ // Model for parsing resumes
│ │ ├── model.py
│ │ ├── requirements.txt
│ │ └── script.py
│ ├── job_matcher/ // Model for matching jobs
│ │ ├── model.py
│ │ ├── requirements.txt
│ │ └── script.py
│ └── cover_letter_generator/ // Model for generating cover letters
│ ├── model.py
│ ├── requirements.txt
│ └── script.py
│
├── database/ // Database related files (if not managed purely by backend)
│ ├── migrations/
│ ├── seeds/
│ └── schema.sql // (if using SQL)
│
├── devops/ // Deployment and operations related files
│ ├── docker-compose.yml // Docker Compose for local development/deployment
│ ├── Dockerfile // Dockerfile for frontend/backend
│ ├── kubernetes/ // Kubernetes configurations (if applicable)
│ └── terraform/ // Infrastructure as Code (if applicable)
│
└── .git/ // Git version control (created automatically)
