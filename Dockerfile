# Use image with uWSGI and Nginx for Flask web applications
FROM tiangolo/uwsgi-nginx-flask:flask

# Copy the requirements.txt into the container
COPY ./requirements.txt .

# Copy the application folder into the container
COPY ./app /app

# Copy the ngix configuration file int the container
COPY ./pydap.conf /etc/nginx/conf.d/

# Install additional packages
RUN \ 
    apt-get update && \
    apt-get install -y netcdf-bin libnetcdf-dev  
    
# Install any needed packages specified in requirements.txt
RUN \
    pip install --upgrade pip && \
    pip install -r requirements.txt
