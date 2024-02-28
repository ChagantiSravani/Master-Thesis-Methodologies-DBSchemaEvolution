# An Empirical Study on Methodologies for Database Schema Evolution

This repository outlines an empirical study focused on methodologies for the evolution of database schemas. It provides detailed instructions for reproducing the study and describes the methodology used. Below are the steps involved:


*Note:* 
- After cloning the [project repositories](#clone), we can proceed to build and run the Docker container(as described in the __Instructions to run the project in docker container__ section). The container will navigate to Jupyter Notebook, where all the required files for analysis are available (__Code, Datasets, MySQLDiff__). No other external resources are necessary.

- After cloning the [project repositories](#clone), If we want to reproduce the database migration files and apply mysqldiff tool follow [Generate Database Migration Files and Apply mysqldiff Tool](#Generate_Database_Migration_Files) section.  

## Clone the repository{#clone}

        git clone https://github.com/ChagantiSravani/Master-Thesis-Methodologies-DBSchemaEvolution.git

  
  - After cloning the repository, clone the required repositories inside the dataset folder. 

-  Cloning the three projects—Joomla, Roundcube, and Weberp—from GitHub to (__/Datasets/{projectname}/Input/Patch_Files/Git_{Projectname}__). After cloning, the patch files for each project are located in the cloned repositories. 

  - Cloneing the project repositories:
  
    - **Joomla Github clone**: git clone https://github.com/joomla/joomla-cms.git Datasets/Joomla/Input/Patch_Files/Git_Joomla
    - **Weberp Github clone** : git clone https://github.com/webERP-team/webERP.git Datasets/Weberp/Input/Patch_Files/Git_WebERP
    - **Roundcube Github clone** : git clone https://github.com/roundcube/roundcubemail.git Datasets/Roundcube/Input/Patch_Files/Git_Roundcube

## Instructions to run the project locally
- Project is implemented on python version 3.6.9.
- requirement.txt contains list of libraries used for this project.
- Before runing the notebook please run "pip install -r requirements.txt" to install the required libraries.

## Instructions to run the project in docker container {#docker-instructions}
- Before running the Dockerfile, please ensure that you have copied the required folders (Code, Datasets, and MySQLDiff) and the file (dockerfile_jupyternotebook) locally. 

- Dockerfile Containes:
    - The Dockerfile copies the Code, Datasets, and MySQLDiff folders to the working directory.
    - It installs the required dependencies.
    - It connects to the Jupyter Notebook.



#### Step 1: Building the Docker image:

- Build the Docker image

      bash

      $ docker build -t <tag-id,tag-name> 
      
      Example:

      bash

      $ docker build -t dockerfile 
    

#### Step 2: Launch the Docker container:
   
    bash

    $ docker run -it -p 8888:8888 -v [host_directory_or_volume]:<working-directory> [image_name]
       
  Replace [host_directory_or_volume] with the directory or volume name of our choice; any valid name can be used, which will be interpreted as the volume name.
   
   Example:

    $ docker run -it -p 8888:8888 -v clever_payne:/home/jovyan/work dockerfile 


It will provide the Jupyter Notebook URL. Copy the URL and paste it into your browser's address bar to navigate to the working directory.

The output will look like this:

To access the server, open this file in a browser:
file:///root/.local/share/jupyter/runtime/jpserver-1-open.html

Or copy and paste one of these URLs:

http://d80494beebfb:8888/tree?token=d55bb824067c491aacce23ec58ce544877dbefbc910c3224
http://127.0.0.1:8888/tree?token=d55bb824067c491aacce23ec58ce544877dbefbc910c3224

      

#### Step 3: [Optional] Verification of Copied Folders:
 After running Docker, the required folders are copied into the working directory inside the container. To verify that the folders are successfully copied into the container, execute the commands below:
    
 Run a shell (bash) inside a container, 
        
        $ docker exec -it <container-name> bash

        Ex: 
        $ docker exec -it clever_payne /bin/bash

 Once inside the container, run the 'ls' command to list the contents of the working directory.    
        
        root@0e514dcef7a1:/home/jovyan/work# ls
        Code  Datasets  MySQLDiff


## Generate Database Migration Files and Apply mysqldiff Tool {#Generate_Database_Migration_Files}

- __Step 1:__  First, upload the initial migration file into the database, and then apply the patch files. Each patch file corresponds to a SQL dump file, which serves as the migration file. For more details, refer to the documentation in the [README.md](https://github.com/ChagantiSravani/Master-Thesis-Methodologies-DBSchemaEvolution/blob/master/MySQLDiff/Database_Migration_Files/Generate_Migration_Files/README.md) file. 


- __Step 2:__ Using the mysqldiff tool to compare the migration files and generate output in TXT and CSV formats (__MySQLDiff/Database_Migration_Files/Docker_Mysqldiff/{projectname}/Output__). Refer to the details in [README.md](https://github.com/ChagantiSravani/Master-Thesis-Methodologies-DBSchemaEvolution/blob/master/MySQLDiff/Database_Migration_Files/Docker_Mysqldiff/README.md) file.


- __Step 3:__  Finally, we analyze the similarities and differences between patch files and migration files in the __Code__ folder. To run the code, follow the procedure [Instructions to run the project in docker container](#docker-instructions) section.




  

## Folders Structure:

### Code

1. **Compare_Methodologies.ipynb**: Merged all projects and analyzed the results.
2. **Joomla_Project.ipynb**: Analyze Joomla dataset.
3. **Roundcube_Project.ipynb**: Analyze Roundcube dataset.
4. **Weberp_Project.ipynb**: Analyze Weberp dataset.
5. **requirements.txt**: Required Python packages

- For the Joomla project, we analyzed the 4.2-dev branch. Unfortunately, that branch has been merged into the 4.4-dev branch in the Joomla GitHub repository. Therefore, in our code, we cloned the 4.4-dev repository, skipping the files related to the 4.3-dev and 4.4-dev branches, and analyzed only the 4.2-dev branch files.

- In the Joomla project, the first patch file, 4.0.0-2018-03-05.sql, includes changes from previous versions as well, indicated by the addition of the /\*CAN FAIL\*/ installer hint. We focused only on the DDL statements relevant to the 4.0.0-2018-03-05 version.

### Datasets

##### Project-wise Folders: Joomla, Roundcube, and Weberp: Each folder contains Input and Output Folders.

#### Input: 

- **Migration_Files:** 
  - Migration raw files: processed migration files.
  
- **Patch_Files:**
  - Cloned repository.

#### Output:

- {Project_Name}_MySQL_Patch_Files.csv: Each Patch file number of SMOS.
- {Project_Name}_Commit_Count.csv: Each Patch file Commit count.
- {Project_Name}_SMOs_and_Commit_Count.csv: Merged Patch files SMOS and commit count.
- {Project_Name}_SQLFile_log_Info.txt: Each Patch file log information.

### MySQLDiff 

#### Database_Migration_Files Folder:

1. Generate_Migration_Files: This directory is responsible for generating migration files using patch files. Files are generated here in the __MySQLDiff/Database_Migration_Files/Generate_Migration_Files/{Projectname}/Migrationfiles__ folder.

2. The processed files are located in the  __MySQLDiff/Database_Migration_Files/Generate_Migration_Files/{Projectname}/Migrationfiles_Mod__.  These same files are copied to the  __Database_Migration_Files/Docker_Mysqldiff/{Projectname}/Input__ folder, and  __Datasets/{projectname}/Input/Migration_Files__ for further processing.

3. Docker_Mysqldiff: Utilize the mysqldiff tool to compare the migration files. The Output folder contains TXT and CSV files __Database_Migration_Files/Docker_Mysqldiff/{Projectname}/Output__. directory, and they are also copied to the __Database_Migration_Files/Docker_Mysqldiff/Output__ for further processing.

#### Output:

4. This folder contains TXT and CSV output files obtained after applying the mysqldiff tool to the database migration files


