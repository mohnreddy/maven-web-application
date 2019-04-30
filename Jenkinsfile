node
{
    properties([
    buildDiscarder(logRotator(numToKeepStr: '3')),
    pipelineTriggers([
        pollSCM('* * * * *')
    ])
])

    def mavenHome = tool name: 'Maven-Jenkins', type: 'maven'
    
    stage ('github')
    {
        git credentialsId: '12c3d3fa-f720-4fd9-9c8a-50a0ec504f16', url: 'https://github.com/mohnreddy/maven-web-application.git'
    }
    
    stage ('buildMaven')
    {
        sh "${mavenHome}/bin/mvn clean package"
    }
    
    stage ('SonarQubereport')
    {
        sh "${mavenHome}/bin/mvn sonar:sonar"
    }
    
    stage ('NexusArtifactory')
    {
        sh "${mavenHome}/bin/mvn deploy"
    }
    
    stage ('WildflyDeploy')
    {
        sh "cp $WORKSPACE/target/*.war /opt/wildfly-16.0.0.Final/standalone/deployments"
    }
    
    stage ('emailNotification')
    {
        emailext attachLog: true, body: 'The Maven Web Application Project Build is Successful...!', subject: 'Build Success', to: 'mohnrreddy@gmail.com'
    }
    
    
    
    
}
