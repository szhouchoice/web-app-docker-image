FROM ubuntu
ENV HOME=/root
RUN apt-get update -y
RUN apt-get install git -y
RUN apt-get install apache2 -y
WORKDIR /
RUN git clone https://github.com/espiderinc/web-app-docker-demo
WORKDIR /web-app-docker-demo/
RUN git checkout -b test-003
RUN git pull origin test-003
RUN cp index.html /var/www/html/
RUN service apache2 restart
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
