FROM icojo/oracle-jdk-1.8:latest
MAINTAINER @icojo
ENV JIRA_VERSION 6.3.4
RUN \
  	apt-get update && \
  	sudo apt-get install apt-transport-https &&\
  	echo "deb https://sdkrepo.atlassian.com/debian/ stable contrib" >>/etc/apt/sources.list && \
  	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys B07804338C015B73 && \
  	sudo apt-get update && \
  	sudo apt-get install atlassian-plugin-sdk && \ 
	apt-get clean

EXPOSE 2990

RUN atlas-run-standalone --product jira --version $JIRA_VERSION --jvmargs -Datlassian.upm.on.demand=true

CMD atlas-run-standalone --product jira --version $JIRA_VERSION --jvmargs -Datlassian.upm.on.demand=true
