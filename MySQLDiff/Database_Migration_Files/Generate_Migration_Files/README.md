The __Archive__ contains zip files of all projects downloaded from the repository tags. It includes the initial migration file required to generate the remaining migration files for study (For details, refer to the README.md file inside the archive, [MySQLDiff/Database_Migration_Files/Generate_Migration_Files/Archives/README.md](https://github.com/ChagantiSravani/Master-Thesis-Methodologies-DBSchemaEvolution/blob/master/MySQLDiff/Database_Migration_Files/Generate_Migration_Files/Archives/README.md)).

The folders __Joomla, Roundcube, and Weberp__ contain subfolders with database migration files (__Migrationfiles, Migrationfiles_Mod__) and patch files (__Patchfiles, Patchfiles_Mod__).


## Extract Patchfiles and Initial Database Migration File

1. Copy patch files from __Datasets/{Projectname}/Input/Patch_Files/{Git_Projectname}__ folder to 
__MySQLDiff/Database_Migration_Files/Generate_Migration_Files/{Projectname}/Patchfiles__ folder. 

  - The path to the patch files inside the cloned repositories :

    - Joomla : __Datasets/Joomla/Input/Patch_Files/Git_Joomla/administrator/components/com_admin/sql/updates/mysql__ folder.
    - Roundcube : __Datasets/Roundcube/Input/Patch_Files/Git_Roundcube/SQL/mysql__ folder.
    - Weberp : __Datasets/Weberp/Input/Patch_Files/Git_WebERP/sql/mysql__ folder. 


__Note:__ 
- The Joomla project's first patch file, 4.0.0-2018-03-05.sql, includes previous version DDL statements. However, we are only utilizing the latest commands related to the patch file starting from the '-- From 4.0.0-2018-03-05.sql' comment. The remaining commands in the first patch file we are commented out. This is because our initial migration file starts from the 4.0.0-2018-02-24.sql file, which already includes modifications from previous versions.

- For Weberp project, we are copying the files from version 3.00. We have excluded the four files 'upgrade2.7-2.8', 'upgrade2.8-2.9', 'upgrade2.9-2.9a', and 'upgrade2.9a-2.9b' because the table names in these files are capitalized. Starting from version 3.00, table names are written in lowercase.


2. Copy the initial migration file from __MySQLDiff/Database_Migration_Files/Generate_Migration_Files/Archives/{projectname.zip}__ to __MySQLDiff/Database_Migration_Files/Generate_Migration_Files__. For more details, refer to the README file at [MySQLDiff/Database_Migration_Files/Generate_Migration_Files/Archives/README.md](https://github.com/ChagantiSravani/Master-Thesis-Methodologies-DBSchemaEvolution/blob/master/MySQLDiff/Database_Migration_Files/Generate_Migration_Files/Archives/README.md).

   - The path to the Initial migation files inside Archives folder:

        - Joomla: __joomla-cms-4.0.0-alpha3.zip/joomla-cms-4.0.0-alpha3/installation/sql/mysql/joomla.sql__ file.
        - Roundcube: __roundcubemail-0.1-beta2.zip/roundcubemail-0.1-beta2/SQL/mysql.initial.sql__ file.
        - Weberp: __webERP-3.0.zip/webERP-3.0/sql/mysql/weberp-demo.sql__ file.

## Pre-process Patchfiles and Initial Database Migration File

3. Pre-process the initial migration file and patch file using the jupyter notebook __MySQLDiff/Database_Migration_Files/Generate_Migration_Files/Roundcube/Preprocessing_Patchfiles_and_Initial_Migrationfile.ipynb__. 

    - The processed initial migration files are located at __MySQLDiff/Database_Migration_Files/Generate_Migration_Files__ with the following files: (Roundcube: 2007101000_mod.sql, Joomla: joomla-4.0.0_mod.sql, Weberp: weberp-demo-initial-migrationfile.sql). 
    - Preprocessed patch files at __MySQLDiff/Database_Migration_Files/Generate_Migration_Files/{Projectname}/Patchfiles_Mod__ folder.


## Generate Migration files

##### Prerequisites

  - Before we begin, ensure you have the following installed:

      - Docker
      - MySQL client

4. Build and run the Docker container using the script {Projectname}_Migration1.py:

        PS:
        MySQLDiff/Database_Migration_Files/Generate_Migration_Files> python3 {Projectname}_Migration1.py

        EX:
        MySQLDiff/Database_Migration_Files/Generate_Migration_Files> python3 Joomla_Migration1.py
        MySQLDiff/Database_Migration_Files/Generate_Migration_Files> python3 Roundcube_Migration1.py
        MySQLDiff/Database_Migration_Files/Generate_Migration_Files> python3 Weberp_Migration1.py

5. Enter the container and upload the initial migration file to the database, then apply patch files and generate 
remaining migration files using {Projectname}_Migration2.py:  

        Open new terminal
        
        PS:
        MySQLDiff/Database_Migration_Files/Generate_Migration_Files> python3 {Projectname}_Migration2.py

        EX:
        MySQLDiff/Database_Migration_Files/Generate_Migration_Files> python3 Joomla_Migration2.py
        MySQLDiff/Database_Migration_Files/Generate_Migration_Files> python3 Roundcube_Migration2.py
        MySQLDiff/Database_Migration_Files/Generate_Migration_Files> python3 Weberp_Migration2.py


- Generated migration files are located at __MySQLDiff/Database_Migration_Files/Generate_Migration_Files/{Projectname}/Migrationfiles__.

6. Preprocess the migration files using the jupyter notebook __MySQLDiff/Database_Migration_Files/Generate_Migration_Files/{Projectname}/Preprocessing_Migrationfiles.ipynb__. 

- The processed migration files are saved in the __MySQLDiff/Database_Migration_Files/Generate_Migration_Files/{Projectname}/Migrationfiles_Mod__ folder. 

- They are also saved in the  __MySQLDiff/Database_Migration_Files/Docker_Mysqldiff/{Projectname}/Input__ folder and __Datasets/Joomla/Input/Migration_Files__ folder for further processing.

## Apply the MySQLDiff tool to the migration files:

7. Apply mysqldiff tool on migration files at __MySQLDiff/Database_Migration_Files/Docker_Mysqldiff__ folder. Refer to the details in the file [MySQLDiff/Database_Migration_Files/Docker_Mysqldiff/README.md](https://github.com/ChagantiSravani/Master-Thesis-Methodologies-DBSchemaEvolution/blob/master/MySQLDiff/Database_Migration_Files/Docker_Mysqldiff/README.md).


