from datetime import datetime, timedelta

# Define the start date and number of weeks
start_date = datetime(2025, 7, 8)
weeks = 12

# Additional debug/code reading tasks per day (Mon–Fri)
debug_reading_block = ("Code Reading / Debugging Practice", 14, 15)  # 2–3 PM

# Generate new events for 12 weeks
debug_reading_events = []
for week in range(weeks):
    for day_offset in range(5):  # Monday to Friday
        current_day = start_date + timedelta(weeks=week, days=day_offset)
        dtstart = current_day.replace(hour=debug_reading_block[1]).strftime("%Y%m%dT%H%M%S")
        dtend = current_day.replace(hour=debug_reading_block[2]).strftime("%Y%m%dT%H%M%S")
        event = f"""BEGIN:VEVENT
SUMMARY:{debug_reading_block[0]}
DTSTART;TZID=America/Edmonton:{dtstart}
DTEND;TZID=America/Edmonton:{dtend}
DESCRIPTION:Practice code reading and debugging using MIT, CMU, or real open source projects.
END:VEVENT
"""
        debug_reading_events.append(event)

# Read existing calendar file
ics_file_path = "/Users/fathiali/Desktop/Home/project/learning/python/calendar/" \
"faang_bootcamp_schedule.ics"
with open(ics_file_path, "r") as file:
    existing_ics = file.read()

# Append new events
new_ics = existing_ics.replace("END:VCALENDAR", "") + "".join(debug_reading_events) + "END:VCALENDAR"

# Save updated calendar
updated_path = "/Users/fathiali/Desktop/Home/project/learning/python/calendar/faang_bootcamp_with_debugging.ics"
with open(updated_path, "w") as f:
    f.write(new_ics)

updated_path

# ics_file_path = "/Users/fathiali/Desktop/Home/project/learning/python/calendar/" \
# "faang_bootcamp_schedule.ics"