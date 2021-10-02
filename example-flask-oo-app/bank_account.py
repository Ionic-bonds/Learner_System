class BankAccount:
    def __init__(self, balance=0, name=''):
        self._balance = balance
        self._name = name

    def deposit(self, amount):
        if amount >= 0:
            self._balance += amount
            return self._balance
        else:
            raise Exception("Negative number!")

    def withdraw(self, amount):
        if amount <= self._balance:
            self._balance -= amount
            return self._balance
        else:
            raise Exception("Insufficient balance!")

    def balance(self):
        return self._balance

    def name(self):
        return self._name