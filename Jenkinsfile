pipeline {
    agent any


    stages {
        stage('Build') {
            steps {
                // Run Maven
                sh "mvn clean package"
            }
		}
		
    
	    stage('Deploy') {
            steps {
                // Copy artifact to server
                sh 'scp ./target/helloworld.war root@192.168.1.201:/opt/tomcat/webapps/'
                
                // Restart Tomcat
                sh 'ssh root@192.168.1.201 \'sudo systemctl restart tomcat\''
                }
            }

        }
    }
