FROM ubuntu:18.04
RUN mkdir -p /var/run/sshd
RUN apt -y update
RUN apt install -y openjdk-8-jdk
RUN apt install -y openssh-server
RUN apt install -y git
#RUN apt install -y maven

#generate the host keys with the default key file path, an empty passphrase

RUN ssh-keygen -A  
ADD ./sshd_config /etc/ssh/sshd_config
RUN adduser --quiet jenkins
RUN echo jenkins:password123 | chpasswd
RUN chown -R jenkins:jenkins /home/jenkins/
#RUN chown -R jenkins:jenkins /home/jenkins/.m2/
#RUN chown -R jenkins:jenkins /home/jenkins/.ssh/
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
