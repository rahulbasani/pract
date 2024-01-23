pipeline{
    
    environment{
        AWS_ACCESS_KEY = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    
    agent any
    
    stages{
        stage('git checkout'){
            steps{
                git 'https://github.com/rahulbasani/pract.git'
            }
        }
        stage('terraform initilaize'){
            steps{
                sh 'terraform init'
            }
        }
        stage('terraform plan'){
            steps{
                sh 'terraform plan -out=tfplan'
            }
        }
        stage('Approval'){
            input{
                message "Apply terraform plan"
                ok "Apply"
            }
            steps{
                sh 'terraform apply tfplan -auto-approve'
            }
        }
    }
}
