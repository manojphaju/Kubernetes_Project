FROM centos:latest
LABEL maintainer="phajumanoj@gmail.com"

# Install required packages
RUN yum install -y httpd zip unzip

# Download and extract the zip file
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Set Apache to serve on port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
