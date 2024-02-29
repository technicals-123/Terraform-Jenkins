 pipeline {
    agent any

    environment {
        ARM_CLIENT_ID = credentials('ARM_CLIENT_ID')
        ARM_CLIENT_SECRET = credentials('ARM_CLIENT_SECRET')
        ARM_TENANT_ID = credentials('ARM_TENANT_ID')
        ARM_SUBSCRIPTION_ID = credentials('ARM_SUBSCRIPTION_ID')
    }

    stages {
     
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

       stage('Terraform Plan') {
             steps{
                 sh 'terraform plan -out=tfplan'
             }
       }
     
        // stage('Terraform Apply') {
        //     steps {
        //         sh 'terraform apply -auto-approve'
        //     }
        // }
        stage('Terraform Apply') {
            steps {
                script {
                    def plan = readFile 'tfplan'
                    input message: "Do you want to apply the plan?",
                          parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                    sh 'terraform apply tfplan'
                }
            }
        }
    }
 }
