pipeline{
    
    parameters{
        choice(name: 'action', choices: ['apply','destroy'], description: 'choose the operation')
    }
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
                message "${params.action} terraform plan"
                ok "${params.action}"
            }
            steps{
                if (params.action == 'apply'){
                    sh 'terraform apply tfplan'
                }
                else{
                    sh 'terraform destroy -auto-approve'
                }
	  }
        }
    }
}
