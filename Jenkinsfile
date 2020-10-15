pipeline {
    agent any
	parameters {
		choice(choices: ['SETUP', 'DELETE'], description: 'Setup Environment or Delete Environment', name: 'TERRA_COMMAND')
    }
    stages {
        stage('Terraform Init') {
            steps {
                sh "whoami"
                println "Setup Environment or Delete Environment : ${TERRA_COMMAND}"
                sh "terraform init"
            }
        }
        stage('Terraform Plan') {
            steps {
                sh "terraform plan -input=false"
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
	                if ("$TERRA_COMMAND" == "SETUP") {
                        sh "terraform apply -input=false -auto-approve"
                    } else {
                        sh "terraform destroy -input=false -auto-approve"
                    }
                }
            }
        }
    }
}