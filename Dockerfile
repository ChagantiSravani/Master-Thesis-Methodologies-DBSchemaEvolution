# Use a Python base image
FROM python:3.9

# Set the working directory
WORKDIR /home/jovyan/work

# Copy required directories into the container
COPY ./Code /home/jovyan/work/Code
COPY ./Datasets /home/jovyan/work/Datasets
COPY ./MySQLDiff /home/jovyan/work/MySQLDiff

# Update pip and install required packages
RUN pip install --upgrade pip && \
    pip install GitPython==3.1.31 pandas==1.5.3 matplotlib==3.4.3 numpy==1.24.2 tabulate==0.8.9 colorama==0.4.6 jupyter

# Expose the port for Jupyter Notebook
EXPOSE 8888

# Set environment variable for display
ENV DISPLAY=:0

# Start Jupyter Notebook with --allow-root
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
