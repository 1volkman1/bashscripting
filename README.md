# bashscripting
----------------------
# Exercise 1
Write a script that:
* Gets 2 positional arguments: <name> <count> and any number of additional arguments
* Checks that all additional arguments are non-numeric strings (fails if not) (Use regular expressions?)
* Creates a directory $HOME/mylogs
* Creates a file called <name>.log in the directory
* For <count> times iterates over the list of additional arguments and writes a line with a the argument string and a random word (use $RANDOM ) out of the following list : 
  * normal 
  * request 
  * failure 
  * error 
  * warning 
  * alert
  * notice
  * note

# Example using generatorlogs.sh scripts
 ~~~~
  296  ./generatorlogs_without_err_fail_war.sh test51 500 dkfkf fdkfdjs sdjfsj skhgsdhus sfhjsfgs sgfhsgysf sdfgsh
  297  ./generatorlogs_without_err_fail_war.sh test52 500 dkfkf fdkfdjs sdjfsj skhgsdhus sfhjsfgs sgfhsgysf sdfgsh
  298  ./generatorlogs_without_err_fail_war.sh test53 500 dkfkf fdkfdjs sdjfsj skhgsdhus sfhjsfgs sgfhsgysf sdfgsh
  299  ./generatorlogs_without_err_fail_war.sh test54 500 dkfkf fdkfdjs sdjfsj skhgsdhus sfhjsfgs sgfhsgysf sdfgsh
  300  ./generatorlogs_without_err_fail_war.sh test55 500 dkfkf fdkfdjs sdjfsj skhgsdhus sfhjsfgs sgfhsgysf sdfgsh
  301  ./generatorlogs_without_err_fail_war.sh test56 500 dkfkf fdkfdjs sdjfsj skhgsdhus sfhjsfgs sgfhsgysf sdfgsh
  302  ./generatorlogs_without_err_fail_war.sh test57 500 dkfkf fdkfdjs sdjfsj skhgsdhus sfhjsfgs sgfhsgysf sdfgsh
  303  ./generatorlogs_without_err_fail_war.sh test58 500 dkfkf fdkfdjs sdjfsj skhgsdhus sfhjsfgs sgfhsgysf sdfgsh
  304  ./generatorlogs_without_err_fail_war.sh test59 500 dkfkf fdkfdjs sdjfsj skhgsdhus sfhjsfgs sgfhsgysf sdfgsh
  305  ./generatorlogs_without_err_fail_war.sh test60 500 dkfkf fdkfdjs sdjfsj skhgsdhus sfhjsfgs sgfhsgysf sdfgsh
 ~~~~
----------------
# Exercise 2
* Generate 10 log files using the utility from the previous exercise
* Write a log processing script that:
* Scans each file in $HOME/mylogs directory
* For each file: 
   * If lines with ‘error’ and ‘failure’ constitute >10% of all lines = log is unhealthy
   * If lines with ‘error’ and ‘failure’ are <10% but lines with ‘warning’ and ‘alert’ are > 20% = log is unstable
* All the rest of the logs are considered healthy
* Zip the logs and copy them accordingly to subfolders: 
~~~
$HOME/mylogs/unhealthy
$HOME/mylogs/unstable
$HOME/mylogs/healthy
~~~
* Print out a report colouring the output accordingly, e.g:
~~~
healthy | 5 log files | ab.log, course.log, devops.log, good.log, fine.log
unstable | 2 log files | ocean.log, earthquake.log
unhealthy | 3 log files | random.log, 23.log, balbala.log
~~~

# Example using coloringlog.sh scripts
~~~
./coloringlog.sh                                                                                           
Errors: 0
Failures: 0
Alerts: 710
Warninigs: 0
Lines in file :     3500
Count failure  + error:  0
Persintage of ‘error’ and ‘failure’ in test57.log: 0 
Count warning  + alert:  710
Persintage of ‘warning’ and ‘alert’ in test57.log: 20
Errors: 0
Failures: 0
Alerts: 703
Warninigs: 0
Lines in file :     3500
Count failure  + error:  0
Persintage of ‘error’ and ‘failure’ in test56.log: 0 
Count warning  + alert:  703
Persintage of ‘warning’ and ‘alert’ in test56.log: 20
Errors: 0
Failures: 0
Alerts: 700
Warninigs: 0
Lines in file :     3500
Count failure  + error:  0
Persintage of ‘error’ and ‘failure’ in test54.log: 0 
Count warning  + alert:  700
Persintage of ‘warning’ and ‘alert’ in test54.log: 20
Errors: 0
Failures: 0
Alerts: 710
Warninigs: 0
Lines in file :     3500
Count failure  + error:  0
Persintage of ‘error’ and ‘failure’ in test55.log: 0 
Count warning  + alert:  710
Persintage of ‘warning’ and ‘alert’ in test55.log: 20
Errors: 0
Failures: 0
Alerts: 708
Warninigs: 0
Lines in file :     3500
Count failure  + error:  0
Persintage of ‘error’ and ‘failure’ in test51.log: 0 
Count warning  + alert:  708
Persintage of ‘warning’ and ‘alert’ in test51.log: 20
Errors: 0
Failures: 0
Alerts: 674
Warninigs: 0
Lines in file :     3500
Count failure  + error:  0
Persintage of ‘error’ and ‘failure’ in test52.log: 0 
Count warning  + alert:  674
Persintage of ‘warning’ and ‘alert’ in test52.log: 19
Errors: 0
Failures: 0
Alerts: 706
Warninigs: 0
Lines in file :     3500
Count failure  + error:  0
Persintage of ‘error’ and ‘failure’ in test53.log: 0 
Count warning  + alert:  706
Persintage of ‘warning’ and ‘alert’ in test53.log: 20
Errors: 0
Failures: 0
Alerts: 724
Warninigs: 0
Lines in file :     3500
Count failure  + error:  0
Persintage of ‘error’ and ‘failure’ in test60.log: 0 
Count warning  + alert:  724
Persintage of ‘warning’ and ‘alert’ in test60.log: 21
Errors: 0
Failures: 0
Alerts: 673
Warninigs: 0
Lines in file :     3500
Count failure  + error:  0
Persintage of ‘error’ and ‘failure’ in test58.log: 0 
Count warning  + alert:  673
Persintage of ‘warning’ and ‘alert’ in test58.log: 19
Errors: 0
Failures: 0
Alerts: 685
Warninigs: 0
Lines in file :     3500
Count failure  + error:  0
Persintage of ‘error’ and ‘failure’ in test59.log: 0 
Count warning  + alert:  685
Persintage of ‘warning’ and ‘alert’ in test59.log: 20
unhealthy|test1.log.zip test10.log.zip test11.log.zip test12.log.zip test13.log.zip test14.log.zip test15.log.zip test16.log.zip test17.log.zip test18.log.zip test19.log.zip test2.log.zip test20.log.zip test3.log.zip test4.log.zip test41.log.zip test42.log.zip test43.log.zip test44.log.zip test45.log.zip test46.log.zip test47.log.zip test48.log.zip test49.log.zip test5.log.zip test50.log.zip test7.log.zip test8.log.zip test9.log.zip 
unstable|test30.log.zip test31.log.zip test32.log.zip test33.log.zip test34.log.zip test35.log.zip test36.log.zip test37.log.zip test38.log.zip test39.log.zip test40.log.zip test6.log.zip test60.log.zip 
healthy|test51.log.zip test52.log.zip test53.log.zip test54.log.zip test55.log.zip test56.log.zip test57.log.zip test58.log.zip test59.log.zip 
~~~
