 pipeline {
    agent any

    environment {
        ARM_CLIENT_ID = credentials('azure-client-id')
        ARM_CLIENT_SECRET = credentials('azure-client-secret')
        ARM_TENANT_ID = credentials('azure-tenant-id')
        ARM_SUBSCRIPTION_ID = credentials('azure-subscription-id')
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your/repository.git'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -var "client_id=${env.ARM_CLIENT_ID}" -var "client_secret=${env.ARM_CLIENT_SECRET}" -var "tenant_id=${env.ARM_TENANT_ID}" -var "subscription_id=${env.ARM_SUBSCRIPTION_ID}" -out=tfplan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply tfplan'
            }
        }
    }
}
