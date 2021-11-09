For our tests, we have done unit tests for the following classes:

a) course overview
b) course record
c) enrolment
d) learner
e) quiz qn
f) section materials
g) section overview
h) section quiz
i) trainer

We have also done integration tests of the routes. We have done so by testing that the routes were able to return the expected messages when we execute them. We also ensured that data was passed successfully with the expected messages.

Steps to running TDD:

1. Install Pytest by running "pip install -U pytest".

2. Change the terminal directory to the tests folder.

3a. To test a particular class, run "Pytest <filename.py>"
3b. Run all the test by running "python -m pytest".