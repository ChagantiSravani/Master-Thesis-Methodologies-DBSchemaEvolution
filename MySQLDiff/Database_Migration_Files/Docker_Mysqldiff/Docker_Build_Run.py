import subprocess


# Step 1: Build Docker image
subprocess.run(["docker", "build", "-t", "dockerfile_mysqldiff", "-f", "Dockerfile", "."])

# Step 2: Run Docker container
subprocess.run(["docker", "run", "dockerfile_mysqldiff"])


