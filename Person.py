class Person:
    def __init__(self, PersonID, name, NRIC, ContactNo, email):
        self.PersonID = PersonID
        self.name = name
        self.NRIC = NRIC
        self.ContactNo = ContactNo
        self.email = email

    def retrievePersonID(self):
        return self.PersonID
    
    def retrievePersonName(self):
        return self.name
    
    def retrieveAlldetails(self):
        print("Person Name:" , self.name)
        print("Person PersonID:" , self.PersonID)
        print("Person NRIC:" , self.NRIC)
        print("Person ContactNo:" , self.ContactNo)
        print("Person Email:" , self.email)

    def retrievePersonNRIC(self):
        return self.NRIC
    
    def returnContactNo(self):
        return self.ContactNo
    
    def returnEmail(self):
        return self.email

class Learner(Person):
    def __init__(self, LearnerID, PersonID, learnername, learnernric, learnercontact, learneremail):
        super().__init__(PersonID, learnername, learnernric, learnercontact, learneremail)
        self.LearnerID = LearnerID
        
    def displaylearner(self):
        print("LearnerID", self.LearnerID)
        Person.retrieveAlldetails(self)

class Trainer(Person):
    def __init__(self, TrainerID, PersonID, TrainerName, TrainerNric, TrainerContact, TrainerEmail):
        super().__init__(PersonID,TrainerName, TrainerNric, TrainerContact, TrainerEmail)
        self.TrainerID = TrainerID
        
    def displayTrainer(self):
        print("TrainerID", self.TrainerID)
        Person.retrieveAlldetails(self)

#Driver code to create 2 Person objects in order to instantiate 1 Learner & 1 Trainer Class
P = Person(1,'Cheebye', '12345679A','82011734','tczh@gmail.com')
P1 = Person(2,'Milopeng','97456723A','9761231','Milokosong@company.com')
print(P.name)

learner = Learner(1,P.PersonID,P.name,P.NRIC,P.ContactNo,P.email)
learner.displaylearner()

trainer = Trainer(1,P1.PersonID,P1.name,P1.NRIC,P1.ContactNo,P1.email)
trainer.displayTrainer()

print(issubclass(Learner,Person))
print(issubclass(Trainer,Person))
