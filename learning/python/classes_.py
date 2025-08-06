class Employee:
    def __init__(self):
        self.__dict__["name"] = "Ji-Soo"
        self.__dict__["age"] = 38
        self.__dict__["position"] = "Developer"
        self.__dict__["salary"] = 1200
        

e = Employee()
print(e)
print(e.__dict__)