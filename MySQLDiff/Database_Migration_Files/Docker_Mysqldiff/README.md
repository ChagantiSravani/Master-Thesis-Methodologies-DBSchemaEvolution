## Running MySQLDiff in Docker
MySQL-Diff is a suite of Perl modules and an accompanying CLI script, mysqldiff, designed for comparing the schemas of two MySQL databases. For further details, please visit http://adamspiers.org/computing/mysqldiff/.

Follow these steps to run MySQLDiff in a Docker container.

## Instructions for running a Docker container in Python code:

#### 1. Build and Run docker container

        PS> MySQLDiff/Database_Migration_Files/Docker_Mysqldiff> python3 Docker_Build_Run.py 

#### 2. Enter container and apply Mysqldiff tool
    Open new terminal and run 

        PS> MySQLDiff/Database_Migration_Files/Docker_Mysqldiff> python3 Docker_Enter_Process.py


- The output of the CSV and TXT files for migration files is saved in the __MySQLDiff/Database_Migration_Files/Docker_Mysqldiff/{Projectname}/Output__ folder. Additionally, output files are also saved in the __MySQLDiff/Output__ folder for further analysis.


## Instructions for running a Docker container in the terminal, step by step:

#### 1.	Run the MySQLDiff Container command in terminal:
 Open terminal where the docker file is located and run below commands.

#### 2.	Build Docker Image:
Build the Docker image: 
    
    $ docker build -t [image_name] . 

    Example: $ docker build -t dockerfile .

#### 3.	Run Docker Image:
Launch the image: 

    $ docker run -it [image_name] 

    Example: $ docker run dockerfile

After running, we'll see:

       Starting MySQL database server mysqld
        su: warning: cannot change directory to /nonexistent: No such file or directory
        ...done.

#### 4.	Check Container Name:
Open new terminal to check the container name of the image, and run below command:

    docker ps

We'll get output like:

    CONTAINER ID   IMAGE               COMMAND                 CREATED         STATUS         NAMES

    d4296f72d627   testing_mysqldiff   "/bin/sh -c 'service…"   57 minutes ago  Up 57 minutes  __charming_goldberg__


#### 5.	Enter the Container:
Open Bash control using the container name:

    $ docker exec -it [container_name] bash

    Example: docker exec -it charming_goldberg bash


#### 6.	Check Copied Files:
Check if files are copied in the container:

    bash : root@d4296f72d627:/usr/src#ls

  We'll get output like:

     root@40d45daaf5e3:/usr/src# ls
     Joomla  Roundcube  Weberp  cmp_SMOs.pl  cmp_schema_changes.py  mysqldiffscript.pl 


#### 7. Run the cmp_schema_changes.py code:
The Python code contains two Perl scripts, "mysqldiffscript.pl" and "cmp_SMOs.pl". It generates outputs for all projects in CSV, TXT, and warning log files.

    bash: root@d4296f72d627:/usr/src# python3 cmp_schema_changes.py


#### 8.	Copy Output Files to local machine:
Copy output files from the container directory to the local machine:

    $docker cp [container_name]:/usr/src/[output filename] [local path]

Examples:
- *docker cp d4296f72d627:/usr/src/Joomla/Output/Joomla_output.txt C:/Users/nambu/Schema_Evolution/MySQLDiff/Database_Migration_Files/Docker_Mysqldiff/Joomla/Output*

- *docker cp d4296f72d627:/usr/src/Roundcube/Output/Roundcube_cmp_Schema.txt C:/Users/nambu/Schema_Evolution/MySQLDiff/Database_Migration_Files/Docker_Mysqldiff/Roundcube/Output*

- *docker cp 6b3176976d1b:/usr/src/Weberp/Output/Weberp/Output/Weberp_cmp_Schema.txt C:/Users/nambu/Schema_Evolution/MySQLDiff/Database_Migration_Files/Docker_Mysqldiff/Weberp/Output*

- *docker cp d4296f72d627:/usr/src/Joomla/Output/Joomla_output.csv C:/Users/nambu/Schema_Evolution/MySQLDiff/Database_Migration_Files/Docker_Mysqldiff/Joomla/Output*

- *docker cp d4296f72d627:/usr/src/Roundcube/Output/Roundcube_cmp_Schema.csv C:/Users/nambu/Schema_Evolution/MySQLDiff/Database_Migration_Files/Docker_Mysqldiff/Roundcube/Output*

- *docker cp d4296f72d627:/usr/src/Weberp/Output/Weberp_cmp_Schema.csv C:/Users/nambu/Schema_Evolution/MySQLDiff/Database_Migration_Files/Docker_Mysqldiff/Weberp/Output*

#################################################################################################################
####  [Optional]: If we want individual projects output in TXT and CSV files, we can also utilize the following Perl scripts:

#### 1.	mysqldiffscript.pl : Generate output in a text file:

    bash : root@d4296f72d627:/usr/src# perl mysqldiffscript.pl $[input files]&>[outputfile]

Examples:
- perl mysqldiffscript.pl $(find Joomla/Input  -type f -name "*.sql" | sort -V)&>Joomla/Output/Joomla_cmp_Schema.txt

- perl mysqldiffscript.pl $(find Roundcube/Input -type f -name "*.sql" | sort -V)&>Roundcube/Output/Roundcube_cmp_Schema.txt

- perl mysqldiffscript.pl $(find Weberp/Input -type f -name "*.sql" | sort -V)&> Weberp/Output/Weberp_cmp_Schema.txt


#### 2.	cmp_SMOs.pl:  Generate output in a csv file and warnings in a log file:

    bash :  root@d4296f72d627:/usr/src# perl cmp_SMOs.pl --csv=[csv outputfile] $[input files]&>[log outputfile]

Examples:
- perl cmp_SMOs.pl --csv= Joomla/Output/Joomla_cmp_Schema.csv $(find Joomla/Input -type f -name "*.sql" | sort -V) 2> Joomla/Logs/Joomla_Warning_Log.log

- perl cmp_SMOs.pl --csv= Roundcube/Output/Roundcube _cmp_Schema.csv $(find Roundcube/Input -type f -name "*.sql" | sort -V) 2> Roundcube/Logs/Roundcube _Warning_Log.log

- perl cmp_SMOs.pl --csv=Weberp/Output/Weberp_cmp_Schema.csv $(find Weberp/Input -type f -name "*.sql" | sort -V) 2> Weberp/Logs/Weberp_Warning_Log.log

