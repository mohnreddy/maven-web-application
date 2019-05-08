FROM tomcat
COPY /var/lib/jenkins/workspace/maven-web-application/target/*.war /usr/local/tomcat/webapps/
