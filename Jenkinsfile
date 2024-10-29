pipeline {
    agent any

    tools{
        maven 'my-maven'
        jdk 'my-jdk'
    }

    stages {
        stage('Git') {
            steps {
                echo 'Pull code from github'
                git url : 'https://github.com/anxgh-n/Book-project-gateway.git',branch:'master'
            }
        }
        stage('Build') {
            steps {
                echo 'Build project using maven'
                bat "mvn clean install -DskipTests"
            }
        }
        stage('Test') {
            steps {
                echo 'Test your application'
                bat "mvn test"
            }
        }
        stage('Deploy'){
            steps{
                echo 'Deploy the project'
                bat 'docker rm -f bookgateway-container || true'
                bat 'docker rmi -f bookgateway-image || true'
                bat 'docker build -t bookgateway-image .'
                bat 'docker run --network eurekabook-network -p 7777:7777 -d --name bookgateway-container bookgateway-image'
            }
        }
    }
}
