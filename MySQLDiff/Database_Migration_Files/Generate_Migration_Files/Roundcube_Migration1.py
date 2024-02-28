import subprocess


# Step 1: Build Docker image
subprocess.run(["docker", "build", "-t", "dockerfile_roundcube", "-f", "dockerfile_roundcube", "."])

# Step 2: Run Docker container
subprocess.run(["docker", "run", "dockerfile_roundcube"])