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

        stage ("Build"){
            steps {
                sh "mvn package"
            }
        }

        stage('Debug') {
            steps {
                sh '''
                echo "Hostname:"
                hostname

                echo "User:"
                whoami

                echo "Maven:"
                which mvn
                mvn --version
                '''
            }
}

    }
}