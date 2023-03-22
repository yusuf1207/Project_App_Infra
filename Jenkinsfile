pipeline {
    agent any
    stages {
        stage('TF-INIT') {
            steps {
                dir("app_infra/ec2") {                       
                sh 'terraform init'
            }
        }
    }
        stage('TF-VALIDATE') {
            steps {
                dir("app_infra/ec2") {
                sh 'terraform validate'
            }
        }
    }
        stage('TF-FMT') {
            steps {
                dir("app_infra/ec2") {
                sh 'terraform fmt'
            }
        }
    }
        stage('TF-PLAN') {
            steps {
                dir("app_infra/ec2") {
                sh 'terraform plan'
            }
        }
    }
        stage('TF-APPLY') {
            steps {
                dir("app_infra/ec2") {
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}
    post {
        always {
            echo "### CLEARNING WORKSPACE ###"
            cleanWs()
        }
    }
}



