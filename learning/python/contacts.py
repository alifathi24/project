contacts = {'number': '4',
          'students':[{'name': 'Sara Holderness', 'email': 'sara@example.com'},
                      {'name': 'Harry Potter', 'email': 'Harry@example.com'},
                      {'name': 'Hermione Granger', 'email': 'hermione@example.com'},
                      {'name': 'Ron Weasley', 'email': 'ron@example.com'}
                    ]
                    
}

print('Student emails:')
for student in contacts['students']:
    print(student['email'])