FROM httpd:latest

LABEL maintainer="phajumanoj@gmail.com"

COPY . /var/www/html/

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]