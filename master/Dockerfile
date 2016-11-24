FROM ubuntu:14.04
MAINTAINER Wayne

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get install -y python-software-properties && \
    apt-get install -y openssh-server && \
    apt-get install -y curl
RUN add-apt-repository ppa:saltstack/salt
RUN apt-get install -y salt-master

RUN mkdir /var/run/sshd
RUN mkdir /root/.ssh
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCk4oLwdXiHzui5w/D3GnRLCiBbetiEO8P6nWOLPLaIKnSugvnWZ5QQDhs1Mbyt6TxhiVPghPoqI259V5JLmzLdFgyQtXsWPoei0GcxBOlWs3stac9CO2gTEbvAIr6kHsxE/rwkpOlQoHMW9/F1efwPv1yyG3aWaXEOGbQBNIzR6e1+xCOz/YaY60OEJWk6xSc1YTFc2RCi5berG6OW34ebUgTQFhu9o0jlHVLar4CKeC87h8KGq8dg4DDUVyO3qOdbi8hPvd+vMoN/d/9gdG16NPVzMqY97j4ODwiKrdan8QL6lWC7qZ8xapxf+foHj66v5ekmYKPWIZBFABpvnyZ9 demo" > /root/.ssh/authorized_keys
RUN chmod 0600 /root/.ssh/authorized_keys
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
