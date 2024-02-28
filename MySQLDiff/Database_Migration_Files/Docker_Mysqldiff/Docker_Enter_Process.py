import subprocess
import os

# Step 3: Check running containers
container_info = subprocess.run(["docker", "ps"], capture_output=True, text=True)


if container_info.returncode == 0:
    containers = container_info.stdout.splitlines()[1:]
    container_info_list = [line.split() for line in containers]
    container_names = [info[0] for info in container_info_list]
    image_names = [info[1] for info in container_info_list]

    # Define the image name 
    target_image_name = "dockerfile_mysqldiff"

    target_container_name = None
    for container, image in zip(container_names, image_names):
        if image == target_image_name:
            target_container_name = container
            break

    if target_container_name:
        print(f"Container name for image '{target_image_name}': {target_container_name}")

# Step 4: Execute a python code within the Docker container
exec_command = ["docker", "exec", "-it", target_container_name, "bash", "-c", "python3 cmp_schema_changes.py"]
subprocess.run(exec_command, check=True)

cwd = os.getcwd()
parent_dir = os.path.dirname(cwd)
pp_dir = os.path.dirname(parent_dir)

local_joomla_migration = os.path.join(cwd, "Joomla")
local_roundcube_migration = os.path.join(cwd, "Roundcube")
local_weberp_migration = os.path.join(cwd, "Weberp")
local_all_migration_txt = os.path.join(pp_dir)

subprocess.run(["docker", "cp", f"{target_container_name}:/usr/src/Joomla/Output", local_joomla_migration])
subprocess.run(["docker", "cp", f"{target_container_name}:/usr/src/Roundcube/Output", local_roundcube_migration])
subprocess.run(["docker", "cp", f"{target_container_name}:/usr/src/Weberp/Output", local_weberp_migration])   

subprocess.run(["docker", "cp", f"{target_container_name}:/usr/src/Joomla/Output", local_all_migration_txt])
subprocess.run(["docker", "cp", f"{target_container_name}:/usr/src/Roundcube/Output", local_all_migration_txt])
subprocess.run(["docker", "cp", f"{target_container_name}:/usr/src/Weberp/Output", local_all_migration_txt])  

print("Process completed successfully.")