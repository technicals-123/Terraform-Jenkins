 pipeline {
    agent any

    environment {
        ARM_CLIENT_ID = credentials('ARM_CLIENT_ID')
        ARM_CLIENT_SECRET = credentials('ARM_CLIENT_SECRET')
        ARM_TENANT_ID = credentials('ARM_TENANT_ID')
        ARM_SUBSCRIPTION_ID = credentials('ARM_SUBSCRIPTION_ID')
    }

   // stages {
       // stage('Checkout') {
          //  steps {
         //       git 'https://github.com/technicals-123/Terraform-Jenkins.git'
       //     }
        //}
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
