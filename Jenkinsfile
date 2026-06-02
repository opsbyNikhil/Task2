pipeline{
    agent {
        label "My-Java-App"
    }
    triggers {
        pollSCM ("* * * * *")

    }


    
    stages {
        stage ("Git-Chckout") {
            steps {
                git url: "https://github.com/opsbyNikhil/Task2.git",
                  branch: "main"
            }
        }

        stage('Debug') {
            steps {
                sh '''
                hostname
                whoami
                '''
            }
        }

        stage ("Build"){
            steps {
                sh "mvn package"
            }
        }

        stage ("Test"){
            steps {
                withCredentials([string(credentialsId: "SONAR_ID", variable: "SONAR_TOKEN")]){
                withSonarQubeEnv("SONAR"){
                    sh """mvn sonar:sonar \
                    -Dsonar.projectkey=opsbyNikhil_spring-petclinic \
                    -Dsonar.organization=opsbynikhil \
                    -Dsonar.host.url=https://sonarcloud.io/ \
                    -Dsonar.login=${SONAR_TOKEN}                
                    """
                }
                }
            }
        }

    }
}