#from centos:6.5
from gpmidi/centos-6.5

RUN echo "NETWORKING=yes" >/etc/sysconfig/network

RUN yum update -y
RUN yum install -y mysql-server

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/my.cnf

ADD ./startup.sh /opt/startup.sh
RUN chmod +x /opt/startup.sh

EXPOSE 3306

CMD ["/bin/bash", "/opt/startup.sh"]
