from employee import Employee

class Company:
    def __init__(self):
        self.employee = []

    def add_employee(self, new_employee):
        self.employee.append(new_employee)

def main():
    my_company = Company()
    