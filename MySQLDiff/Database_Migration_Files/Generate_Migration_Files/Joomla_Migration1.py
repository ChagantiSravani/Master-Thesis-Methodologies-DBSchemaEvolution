import subprocess

#Joomla
# Step 1: Build Docker image
subprocess.run(["docker", "build", "-t", "dockerfile_joomla", "-f", "dockerfile_joomla", "."])

# Step 2: Run Docker container
subprocess.run(["docker", "run", "dockerfile_joomla"])

