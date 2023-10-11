FROM httpd:latest

LABEL maintainer="Bard"

COPY . /var/www/html/

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]