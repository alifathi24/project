from datetime import datetime, timedelta

# Manual .ics file generation
bootcamp_start = datetime(2025, 7, 8)
weeks = 12

# Daily schedule (weekdays)
events = []
for week in range(weeks):
    for day_offset in range(5):  # Monday to Friday
        current_day = bootcamp_start + timedelta(weeks=week, days=day_offset)
        date_str = current_day.strftime("%Y%m%d")

        for title, start_hour, end_hour in [
            ("LeetCode Practice", 8, 9),
            ("Project Building", 9, 11),
            ("iOS or Backend Learning", 11, 13),
            ("Reading / Systems / AI", 13, 14)
        ]:
            dtstart = current_day.replace(hour=start_hour).strftime("%Y%m%dT%H%M%S")
            dtend = current_day.replace(hour=end_hour).strftime("%Y%m%dT%H%M%S")
            event = f"""BEGIN:VEVENT
SUMMARY:{title}
DTSTART;TZID=America/Edmonton:{dtstart}
DTEND;TZID=America/Edmonton:{dtend}
DESCRIPTION:{title} session for FAANG Bootcamp
END:VEVENT
"""
            events.append(event)

# Write the full ICS file
ics_content = "BEGIN:VCALENDAR\nVERSION:2.0\nCALSCALE:GREGORIAN\n" + "".join(events) + "END:VCALENDAR"

# Save to file
ics_file_path = "/Users/fathiali/Desktop/Home/project/learning/python/calendar/" \
"faang_bootcamp_schedule.ics"
with open(ics_file_path, "w") as file:
    file.write(ics_content)

ics_file_path
