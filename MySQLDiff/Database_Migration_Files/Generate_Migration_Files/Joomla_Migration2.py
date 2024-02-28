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
    target_image_name = "dockerfile_joomla"

    target_container_name = None
    for container, image in zip(container_names, image_names):
        if image == target_image_name:
            target_container_name = container
            break

    if target_container_name:
        print(f"Container name for image '{target_image_name}': {target_container_name}")

 
        commands = [
        "mysql -proot --force -e \"CREATE DATABASE IF NOT EXISTS Joomla; USE Joomla; source docker-joomla.d/joomla-4.0.0_mod.sql\"",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2018-02-24.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2018-03-05_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2018-03-05.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2018-05-15_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2018-05-15.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2018-07-19_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2018-07-19.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2018-07-29_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2018-07-29.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2018-08-29_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2018-08-29.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2019-03-09_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2019-03-09.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2019-03-30_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2019-03-30.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2019-04-15_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2019-04-15.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2019-04-22_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2019-04-22.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2019-05-20_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2019-05-20.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2019-06-29_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2019-06-29.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2019-07-13_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2019-07-13.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2019-09-13_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2019-09-13.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2019-09-22_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2019-09-22.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2019-10-06_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2019-10-06.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2019-10-17_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2019-10-17.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2020-02-02_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2020-02-02.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2020-03-10_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2020-03-10.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2020-03-25_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2020-03-25.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2020-05-29_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2020-05-29.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2020-09-27_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2020-09-27.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2020-12-20_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2020-12-20.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2021-04-22_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2021-04-22.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2021-04-27_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2021-04-27.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2021-05-30_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2021-05-30.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2021-06-04_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2021-06-04.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2021-08-13_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2021-08-13.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.0-2021-08-17_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.0-2021-08-17.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.3-2021-09-04_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.3-2021-09-04.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.3-2021-09-05_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.3-2021-09-05.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.0.6-2021-12-23_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.0.6-2021-12-23.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.1.0-2021-11-20_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.1.0-2021-11-20.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.1.0-2021-11-28_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.1.0-2021-11-28.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.1.0-2021-12-29_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.1.0-2021-12-29.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.1.0-2022-01-08_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.1.0-2022-01-08.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.1.0-2022-01-19_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.1.0-2022-01-19.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.1.0-2022-01-24_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.1.0-2022-01-24.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.1.1-2022-02-20_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.1.1-2022-02-20.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.1.3-2022-04-07_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.1.3-2022-04-07.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.1.3-2022-04-08_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.1.3-2022-04-08.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.2.0-2022-05-15_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.2.0-2022-05-15.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.2.0-2022-06-15_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.2.0-2022-06-15.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.2.0-2022-06-19_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.2.0-2022-06-19.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.2.0-2022-06-22_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.2.0-2022-06-22.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.2.0-2022-07-07_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.2.0-2022-07-07.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.2.1-2022-08-23_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.2.1-2022-08-23.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.2.3-2022-09-07_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.2.3-2022-09-07.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.2.7-2022-12-29_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.2.7-2022-12-29.sql",
        "mysql -proot --force -e \"USE Joomla; source docker-joomla.d/Patchfiles/4.2.9-2023-03-07_mod.sql\" || true",
        "mysqldump -u root -proot Joomla > docker-joomla.d/Migrationfiles/joomla_4.2.9-2023-03-07.sql"   
        ]

        # Execute commands
        for command in commands:
            subprocess.run(["docker", "exec", target_container_name, "/bin/bash", "-c", command], shell=True)

        # Step 7: Copy Migration directory from Docker container to local directory
        cwd = os.getcwd()
        local_migration_folder = os.path.join(cwd, "Joomla")
        subprocess.run(["docker", "cp", f"{target_container_name}:/docker-joomla.d/Migrationfiles", local_migration_folder])
    else:
        print(f"No containers found with image name '{target_image_name}'")
else:
    print("Docker container is not running.")
