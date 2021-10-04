class Person:
    def __init__(self, PersonID, name, NRIC, ContactNo, email):
        self.PersonID = PersonID
        self.name = name
        self.NRIC = NRIC
        self.ContactNo = ContactNo
        self.email = email

    def retrievePersonID(self):
        print("ID" + self.PersonID)
    
    def retrieveAlldetails(self):
        return self.name, self.PersonID, self.NRIC, self.email, self.ContactNo
    def retrievePersonNRIC(self):
        return self.NRIC
    
    def returnContactNo(self):
        return self.ContactNo
    
    def returnEmail(self):
        return self.email

class Learner(Person):
    def __init__(self, LearnerID, PersonID, learnername, learnernric, learnercontact, learneremail):
        self.LearnerID = LearnerID
        Person.__init__(self, PersonID, learnername, learnernric, learnercontact, learneremail)
    
    def displaylearner(self):
        print("LearnerID", self.LearnerID)
        Person.retrieveAlldetails(self)


class Trainer(Person):
    def __init__(self, TrainerID, PersonID, TrainerName, TrainerNric, TrainerContact, TrainerEmail):
        self.TrainerID = TrainerID
        Person.__init__(self, PersonID, TrainerName, TrainerNric, TrainerContact, TrainerEmail)
    
    def displayTrainer(self):
        print("TrainerID", self.TrainerID)
        print(Person.retrieveAlldetails(self))

person = Person(1,'Cheebye','12345679A','82011734','tczh@gmail.com')
person1 = Person(2,'Talkcock','9123712A','9712312','tczh@ALBCX.com')

learner = Learner(1,1,'Cheebye','12345679A','82011734','tczh@gmail.com')
learner.displaylearner()

trainer = Trainer(1,2,'Talkcock','9123712A','9712312','tczh@ALBCX.com')
trainer.displayTrainer()

print(person.name)

print(isinstance(learner, Learner))
print(isinstance(person, Person))
print(issubclass(Person,Learner))
print(issubclass(Learner,Person))
