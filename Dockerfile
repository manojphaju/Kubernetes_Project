FROM centos:latest
LABEL maintainer="phajumanoj@gmail.com"

# Use a specific mirror for 'appstream'
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-AppStream.repo && \
    sed -i 's/#baseurl/baseurl/g' /etc/yum.repos.d/CentOS-AppStream.repo && \
    sed -i 's/mirror.centos.org/mirrorlist.centos.org/g' /etc/yum.repos.d/CentOS-AppStream.repo


# Install required packages
RUN yum install -y httpd zip unzip

# Download and extract the zip file
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Set Apache to serve on port 80
EXPOSE 80 22

# Start Apache in the foreground
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
