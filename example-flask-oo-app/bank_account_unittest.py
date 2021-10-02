import unittest
from bank_account import BankAccount


class TestBankAccount(unittest.TestCase):
    def test_deposit(self):
        acc = BankAccount(1000, "Phris")
        bal = acc.balance()
        self.assertEqual(bal, 1000)
        self.assertEqual(acc.name(), "Phris")
        self.assertEqual(acc.deposit(500), 1500)

    def test_deposit_negative(self):
        acc = BankAccount(1000, "Phris")
        bal = acc.balance()
        self.assertEqual(bal, 1000)
        self.assertEqual(acc.name(), "Phris")
        self.assertRaises(Exception, acc.deposit, -500)

    def test_withdraw(self):
        acc = BankAccount(1500, "Hyacinth")
        bal = acc.balance()
        self.assertEqual(bal, 1500)
        self.assertEqual(acc.withdraw(1000), 500)
        self.assertRaises(Exception, acc.withdraw, 600)
        
    def test_equal_account(self):
        acc1 = BankAccount(1000, "Phris")
        acc2 = BankAccount(1500, "Hyacinth")
        acc3 = acc1
        self.assertIsNot(acc1, acc2)
        self.assertIs(acc1, acc1)
        self.assertIs(acc1, acc3)


if __name__ == "__main__":
    unittest.main()