pipeline {
    agent any
	parameters {
		choice(choices: ['SETUP', 'DELETE'], description: 'Setup Environment or Delete Environment', name: 'TERRA_COMMAND')
    }
    stages {
        stage('Terraform Init') {
            steps {
                println "Setup Environment or Delete Environment : ${TERRA_COMMAND}"
                sh "/usr/local/bin/terraform init"
            }
        }
        stage('Terraform Plan') {
            steps {
                sh "/usr/local/bin/terraform plan -input=false"
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
	                if ("$TERRA_COMMAND" == "SETUP") {
                        sh "/usr/local/bin/terraform apply -input=false -auto-approve"
                    } else {
                        sh "/usr/local/bin/terraform destroy -input=false -auto-approve"
                    }
                }
            }
        }
    }
}