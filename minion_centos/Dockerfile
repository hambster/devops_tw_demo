FROM centos:7
MAINTAINER Wayne

RUN yum install -y openssh-server openssh-clients
RUN yum install -y https://repo.saltstack.com/yum/redhat/salt-repo-2016.3-1.el7.noarch.rpm
RUN yum clean expire-cache
RUN yum install -y salt-minion
RUN /usr/bin/ssh-keygen -A
ENV container docker

RUN mkdir /var/run/sshd
RUN mkdir /root/.ssh
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCk4oLwdXiHzui5w/D3GnRLCiBbetiEO8P6nWOLPLaIKnSugvnWZ5QQDhs1Mbyt6TxhiVPghPoqI259V5JLmzLdFgyQtXsWPoei0GcxBOlWs3stac9CO2gTEbvAIr6kHsxE/rwkpOlQoHMW9/F1efwPv1yyG3aWaXEOGbQBNIzR6e1+xCOz/YaY60OEJWk6xSc1YTFc2RCi5berG6OW34ebUgTQFhu9o0jlHVLar4CKeC87h8KGq8dg4DDUVyO3qOdbi8hPvd+vMoN/d/9gdG16NPVzMqY97j4ODwiKrdan8QL6lWC7qZ8xapxf+foHj66v5ekmYKPWIZBFABpvnyZ9 demo" > /root/.ssh/authorized_keys
RUN chmod 0600 /root/.ssh/authorized_keys
RUN echo "export VISIBLE=now" >> /etc/profile
RUN echo "master: salt-master" > /etc/salt/minion

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
