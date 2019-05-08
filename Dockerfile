FROM tomcat
COPY /var/lib/jenkins/workspace/maven-web-application/target/maven-web-application.war /usr/local/tomcat/webapps/
