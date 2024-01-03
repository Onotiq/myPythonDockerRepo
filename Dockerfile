# Specifies the base image for this Docker image. It uses Alpine Linux version 3.5 as the starting point. 
# Alpine is known for its small size, making it a popular choice for Docker images due to its lightweight nature.
FROM alpine:3.5

# installs Python and Pip, the Python package manager, into the image.
RUN apk add --update py2-pip

# Copy the requirements.txt file from the local directory into the /usr/src/app/ directory within the image. 
# This file typically lists the Python modules required for the Python application to run.
COPY requirements.txt /usr/src/app/

# Uses Pip to install Python modules specified in requirements.txt into the image. 
# The --no-cache-dir flag prevents Pip from using cached packages during installation, ensuring that the image remains consistent.
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# Copies the app.py file and an index.html file located in the templates directory from the local machine into the corresponding 
# directories within the image's /usr/src/app/ directory. 
# These files are necessary for the Python application to run.
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

# Informs Docker that the container will listen on port 5000 at runtime. 
# This does not actually publish the port; it serves as a documentation for users of the image.
EXPOSE 5000

# run the application
CMD ["python", "/usr/src/app/app.py"]
