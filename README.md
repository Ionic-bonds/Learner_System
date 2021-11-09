Steps to running Learner System application:

1. Connect SQL database by running phpMyAdmin via Docker container
 - In your command prompt, enter the command: docker run --name myadmin -d -e PMA_HOST=spm-database-1.cujkm1zfxmqs.us-east-2.rds.amazonaws.com -p 8080:80 phpmyadmin
 - This will set up and connect Docker's phpMyAdmin with the RDS instance of the application

2. To access application instance, enter in the URL: http://3.144.166.168/efs-mount-point/sampledir/
 - To access learner's dashboard page - http://3.144.166.168/efs-mount-point/sampledir/LearnerSystemHTML/
 - To access admin's dashboard page - http://3.144.166.168/efs-mount-point/sampledir/LearnerSystemHTML/admin-dashboard.html

3. To test the TDD test cases:
 - Go into test folder: cd tests
 - Install pytest on command prompt terminal: pip install -U pytest
 - Run all the tests on pytest: python -m pytest 
 - Run individual tests: pytest {test_filename}.py


<!-- 1. Load application into putty 
 - Host Name: 3.144.166.168
 - SSH > Auth > Private key file: spm.ppk
 - Run session. Login as: ec2-user
 - Run python to start the application: python3 PersonClass.py

2. Change directory by using the command: cd /var/www/html/efs-mount-point/sampledir
 - The full application will be stored in that directory 

3. Access database via phpMyAdmin on your browser using the URL: http://localhost:8080/
 - Username: spm
 - Password: *********
 - To check if database is connected to the instance, access http://3.144.166.168:5016/person. If no error message shows up, it means connection is successful. -->
 
