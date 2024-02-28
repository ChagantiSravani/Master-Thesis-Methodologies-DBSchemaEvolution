import subprocess

#Weberp
# Step 1: Build Docker image
subprocess.run(["docker", "build", "-t", "dockerfile_weberp", "-f", "dockerfile_weberp", "."])

# Step 2: Run Docker container
subprocess.run(["docker", "run", "dockerfile_weberp"])