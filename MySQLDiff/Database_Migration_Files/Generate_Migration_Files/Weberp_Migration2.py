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
    target_image_name = "dockerfile_weberp"

    target_container_name = None
    for container, image in zip(container_names, image_names):
        if image == target_image_name:
            target_container_name = container
            break

    if target_container_name:
        print(f"Container name for image '{target_image_name}': {target_container_name}")

        commands = [
            "mysql -proot --force -e \"CREATE DATABASE IF NOT EXISTS Weberp; USE Weberp; source docker-weberp.d/weberp-demo-initial-migrationfile.sql\"",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-3.0-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade3.00-3.01_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-3.01-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade3.01-3.02_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-3.02-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade3.02-3.03_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-3.03-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade3.03-3.04_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-3.04-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade3.04-3.05_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-3.05-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade3.05-3.06_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-3.06-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade3.06-3.07_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-3.07-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade3.07-3.08_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-3.08-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade3.08-3.09_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-3.09-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade3.09-3.10_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-3.10-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade3.10-3.11_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-3.11-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade3.11-3.11.1_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-3.11.1-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade3.11.1-4.00_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.00-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.03-4.04_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.04-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.04-4.04.1_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.04.1-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.04.1-4.04.4_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.04.4-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.04.4-4.04.5_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.04.5-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.04.5-4.05_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.05-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.05-4.06_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.06-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.06-4.07_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.07-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.07-4.08_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.08-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.08-4.09_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.09-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.09-4.10_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.10-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.10-4.11_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.11-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.11.1-4.11.2_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.11.2-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.11.2-4.11.3_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.11.3-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.11.3-4.11.4_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.11.4-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.11.4-4.12_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.12-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.12-4.12.1_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.12.1-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.12.1-4.12.2_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.12.2-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.12.2-4.12.3_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.12.3-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.12.3-4.13_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.13-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.13-4.13.1_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.13.1-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.13.1-4.14_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.14-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.14-4.14.1_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.14.1-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.14.1-4.15_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.15-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.15-4.15.1_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.15.1-demo.sql",
            "mysql -proot --force -e \"USE Weberp; source docker-weberp.d/Patchfiles/upgrade4.15.1-4.15.2_mod.sql\" || true",
            "mysqldump -u root -proot Weberp > docker-weberp.d/Migrationfiles/Weberp-4.15.2-demo.sql"       
        ]
            # Execute commands
        for command in commands:
            subprocess.run(["docker", "exec", target_container_name, "/bin/bash", "-c", command], shell=True)

        # Step 7: Copy Migration directory from Docker container to local directory
        cwd = os.getcwd()
        local_migration_folder = os.path.join(cwd, "Weberp")
        subprocess.run(["docker", "cp", f"{target_container_name}:/docker-weberp.d/Migrationfiles", local_migration_folder])
    else:
        print(f"No containers found with image name '{target_image_name}'")
else:
    print("Docker container is not running.")

