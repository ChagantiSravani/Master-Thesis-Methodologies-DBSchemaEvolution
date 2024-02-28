import os
import subprocess

# Step 3: Check running containers
container_info = subprocess.run(["docker", "ps"], capture_output=True, text=True)

# Check if Docker container is running
if container_info.returncode == 0:
    containers = container_info.stdout.splitlines()[1:]
    container_info_list = [line.split() for line in containers]
    container_names = [info[0] for info in container_info_list]
    image_names = [info[1] for info in container_info_list]

    # Define the image name 
    target_image_name = "dockerfile_roundcube"

    target_container_name = None
    for container, image in zip(container_names, image_names):
        if image == target_image_name:
            target_container_name = container
            break

    if target_container_name:
        print(f"Container name for image '{target_image_name}': {target_container_name}")


        commands = [
        "mysql -proot --force -e \"CREATE DATABASE IF NOT EXISTS Roundcube; USE Roundcube; source docker-roundcube.d/2007101000_mod.sql\"",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2007101000.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2008030300_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2008030300.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2008040500_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2008040500.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2008060900_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2008060900.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2008092100_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2008092100.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2009090400_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2009090400.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2009103100_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2009103100.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2010042300_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2010042300.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2010100600_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2010100600.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2011011200_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2011011200.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2011092800_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2011092800.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2011111600_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2011111600.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2011121400_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2011121400.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2012080700_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2012080700.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2013011000_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2013011000.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2013042700_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2013042700.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2013052500_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2013052500.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2013061000_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2013061000.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2014042900_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2014042900.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2015030800_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2015030800.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2015111100_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2015111100.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2016081200_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2016081200.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2016100900_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2016100900.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2016112200_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2016112200.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2018021600_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2018021600.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2018122300_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2018122300.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2019092900_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2019092900.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2020020100_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2020020100.sql",    
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2020020101_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2020020101.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2020091000_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2020091000.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2020122900_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2020122900.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2021081000_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2021081000.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2021100300_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2021100300.sql",   
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2022081200_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2022081200.sql",
        "mysql -proot --force -e \"USE Roundcube; source docker-roundcube.d/Patchfiles/2022100100_mod.sql\" || true",
        "mysqldump -u root -proot Roundcube > docker-roundcube.d/Migrationfiles/Roundcube_2022100100.sql"
        ]

        # Execute commands
        for command in commands:
            subprocess.run(["docker", "exec", target_container_name, "/bin/bash", "-c", command], shell=True)

        # Step 7: Copy Migration directory from Docker container to local directory
        cwd = os.getcwd()
        local_migration_folder = os.path.join(cwd, "Roundcube")
        subprocess.run(["docker", "cp", f"{target_container_name}:/docker-roundcube.d/Migrationfiles", local_migration_folder])
    else:
        print(f"No containers found with image name '{target_image_name}'")
else:
    print("Docker container is not running.")
