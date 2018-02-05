## =============================================================
##	Image: ol7base
##	Author: Donald Raikes <don.raikes@oracle.com>
##	Date:	01/05/2018
##
##	A base image used for all security testing tool images.
##
##	Includes:
##		oraclelinux:7-slim
##		jdk 1.8.0_144
##		maven 3.5.2
##---------------------------------------------------------
##	modification history:
##	01/05/2018	draikes	-	Creted basic image.
## =============================================================
FROM	oraclelinux:7-slim
MAINTAINER 	Donald Raikes <don.raikes@oracle.com>

##	Update the base image:
COPY		yum/* /etc/yum.repos.d/
RUN		yum upgrade -y && \
		yum install -y \
			bzip2 \
			curl \
			gzip \
			tar \
			unzip \
			git \
			firefox \
			mlocate \
			sudo \
			libXtst \
			vim \
			nano  \
			tigervnc-server-minimal \
			google-chrome-stable \
			python-setuptools

##	setup some common environment settings:
ADD		.env	/etc/
RUN		echo ". /etc/.env" >> /root/.bashrc 
## Add pip to python:
RUN		easy_install pip wheel

## add jdk 8
ENV JAVA_PKG=server*.tar.gz \
    JAVA_HOME=/usr/java/default

ADD software/$JAVA_PKG /usr/java/


RUN export JAVA_DIR=$(ls -1 -d /usr/java/*) && \
    ln -s $JAVA_DIR /usr/java/latest && \
    ln -s $JAVA_DIR /usr/java/default && \
    alternatives --install /usr/bin/java java $JAVA_DIR/bin/java 20000 && \
    alternatives --install /usr/bin/javac javac $JAVA_DIR/bin/javac 20000 && \
    alternatives --install /usr/bin/jar jar $JAVA_DIR/bin/jar 20000

##	Add maven 3.5.2:
WORKDIR	/opt
RUN	curl http://ftp.wayne.edu/apache/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz | tar zxv

## 	Create the default user:
RUN		groupadd -g 8500 dba && \
		useradd -g 8500 -u 50491 -m -s /bin/bash user && \
		echo user:user | chpasswd && \
		mkdir /scratch && \
		chown user:dba /scratch

ADD		software/gecko*.gz /usr/bin/
ADD		software/chromedriver_linux64.zip /usr/bin
WORKDIR		/usr/bin
RUN		chmod 755 chrome* gecko*
##	configure the user user .bashrc file:
USER	user
WORKDIR	/home/user
RUN		mkdir .m2 .ssh bin repo reports && \
		chmod -R 755 /home/user && \
		echo ". /etc/.env" >> /home/user/.bashrc && \
		echo "export PATH=\$HOME/bin:\$PATH" >> /home/user/.bashrc

USER	user
VOLUME	{'/home/user/reports'}
