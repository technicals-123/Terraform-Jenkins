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
                sh 'terraform init -auto-approve'
            }
        }
// stage('Terraform Init') {
//     steps {
//         script {
//             input message: "Do you want to initialize Terraform?",
//                   ok: "Yes",
//                   parameters: [choice(name: 'Confirmation', choices: ['Yes', 'No'])]
//             if (params.Confirmation == 'Yes') {
//                 sh 'terraform init'
//             } else {
//                 echo 'Skipping Terraform initialization.'
//             }
//         }
//     }
// }
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan -out=tfplan'
                    sh 'terraform show -json tfplan > tfplan.json'
                }
            }
        }

        stage('Review Terraform Plan') {
            steps {
                script {
                    def planOutput = readFile 'tfplan.json'
                    echo planOutput
                    input message: "Review the plan before proceeding",
                          parameters: [text(name: 'Plan', description: 'Terraform plan', defaultValue: planOutput)]
                }
            }
        }

        stage('Apply Terraform Plan') {
            steps {
                script {
                    sh 'terraform apply tfplan'
                }
            }
        }

        stage('Destroy Infrastructure') {
            steps {
                script {
                    input message: "Are you sure you want to destroy the infrastructure?",
                          ok: "Destroy",
                          parameters: [choice(name: 'Confirmation', choices: 'Destroy')]
                    sh 'terraform destroy -auto-approve'
                }
            }
        }
    }
}
