# Migration Files

## Archives Folder
Contains zip files downloaded from tags of respective repositories. (All versions are organized under repository tags)

## 1. Joomla
- **Download Path:** [Joomla 4.0.0-alpha3](https://github.com/joomla/joomla-cms/releases/tag/4.0.0-alpha3)
- **Downloaded File:** joomla-cms-4.0.0-alpha3.zip
- **Initial Migration File Extraction:**
  - Extracted initial migration file from: `joomla-cms-4.0.0-alpha3.zip/joomla-cms-4.0.0-alpha3/installation/sql/mysql/joomla.sql`
- **Note:**
  - Extracted the initial database migration file from this zip file because the patch file '4.0.0-2018-02-24.sql' begins in this zip file.
  
  - The first patch file (`4.0.0-2018-03-05.sql`) contains previous version alter statements. We commented old previous version statements before applying the patch to the database.

- **Renaming:**
  - Renamed initial migration file `joomla.sql` to `joomla_4.0.0-2018-02-24.sql`  

## 2. Weberp
- **Download Path:** [webERP 3.0](https://github.com/webERP-team/webERP/releases/tag/v3.0)
- **Downloaded File:** webERP-3.0.zip
- **Initial Migration File Extraction:**
  - Extracted initial migration file from: `webERP-3.0.zip/webERP-3.0/sql/mysql/weberp-demo.sql`

  - **Renaming:**
  - Renamed initial migration file `weberp-demo.sql` to `weberp-demo-original.sql` 



## 3. Roundcube
- **Download Path:** [Roundcube 0.1-beta2](https://github.com/roundcube/roundcubemail/releases/tag/v0.1-beta2)
- **Downloaded File:** roundcubemail-0.1-beta2.zip
- **Initial Migration File Extraction:**
  - Extracted initial migration file from: `roundcubemail-0.1-beta2.zip/roundcubemail-0.1-beta2/SQL/mysql.initial.sql`
- **Renaming:**
  - Renamed to `mysql.initial.sql` to `2007101000.sql` and used as the first migration file.

**Note:** Extract and copy these three files to the __MySQLDiff/Database_Migration_Files/Generate_Migration_Files__ folder.