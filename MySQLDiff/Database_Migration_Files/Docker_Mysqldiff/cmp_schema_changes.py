####################################################################################
#
# cmp_schema_changes.py - script for comparing database schema files using mysqldiff, and generate output in TXT and CSV files.
# Copyright (C) 2023  Sravani Namburi
#
# cmp_schema_changes.py program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
# 
# cmp_schema_changes.py program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License along
# with cmp_schema_changes.py program; If not, see <https://www.gnu.org/licenses/>.
#
####################################################################################

import subprocess
import os
import time

def project_arguments(projects=None):
    if projects is None:
        projects = ["Joomla", "Roundcube", "Weberp"]
    return {"projects": projects}

def run_project(project_name):
    # Generate CSV file Output
    csv_file = f"{project_name}/Output/{project_name}_cmp_Schema.csv"
    sql_files = f'$(find {project_name}/Input -type f -name "*.sql" | sort -V)'
    log_file = f'{project_name}/Logs/{project_name}_Warnings_Log.log'
    cmd = f'perl cmp_SMOs.pl --csv={csv_file} {sql_files} 2> {log_file}'
    subprocess.run(cmd, shell=True)
    
    # Generate txt file Output
    txt_file = f"{project_name}/Output/{project_name}_cmp_Schema.txt"
    sql_files = f'$(find {project_name}/Input -type f -name "*.sql" | sort -V)'
    cmd1 = f'perl mysqldiffscript.pl {sql_files} &> {txt_file}'

  
    with open(txt_file, 'w') as output_file:
        process = subprocess.Popen(cmd1, shell=True, stdout=output_file, stderr=subprocess.STDOUT)
    
    # Wait for the file size to stabilize
    previous_size = -1
    while True:
        current_size = os.path.getsize(txt_file)
        if current_size == previous_size:
            break
        previous_size = current_size
        time.sleep(90)  
    
    # Wait for the subprocess to complete
    process.wait()
    
    # Print a completion message
    print(f"{project_name} migration files comparison done.")

def main():
    projects = ["Joomla", "Roundcube", "Weberp"]
    for project in projects:
        run_project(project)

if __name__ == "__main__":
    main()
