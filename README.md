

This project is used to list all the cmd for creating image from dockerfile, pushing the image to docker hub or making image from a running container.

---
### To Create image from a container in docker
```
docker commit cont_name image_name
```
---
## To Create Image from a Dockerfile
### 1. First we create an simple image from dockerfile: 
```
FROM ubuntu:18.04
LABEL maintainer="Prasoon Mishra <prassonmishra330@gmail.com@gmail.com>"
RUN mkdir -p /var/run/sshd
RUN apt -y update
RUN apt install -y openjdk-8-jdk
RUN apt install -y git
RUN apt install -y openssh-server
RUN ssh-keygen -A
ADD ./sshd_config /etc/ssh/sshd_config
RUN echo jenkins:password123 | chpasswd
RUN chown -R jenkins:jenkins /home/jenkins/
#RUN chown -R jenkins:jenkins /home/jenkins/.m2/
#RUN chown -R jenkins:jenkins /home/jenkins/.ssh/
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
```
- To Build above docker file: 
```
 docker build -t jenkins_slave .
  ```
 ## 2. Now,we have image created (docker images), it's time to push this image to dockerhub.

 - First,we need to create one account in [dockerhub](https://hub.docker.com/) and then create one repository in it with visibility set to the private 
 - Go to the terminal and issue below cmd for login in docker give your specified user-name and password for dockerhub
 ```
 docker login
 ```
 - Then Tag your image with below cmd:(note your repository_name from above dockerhub and your image id which you want to push )
 ```
 docker tag 57d6ff8a0de8  prasoonm/prasoon-jenkins-inbound-docker:1.0
 ```
- Then, push your image to the dockerhub by using below cmd:
```
docker push prasoonm/prasoon-jenkins-inbound-docker:1.0
```

