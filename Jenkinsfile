pipeline{
    agent any
    stages{
        stage ("check docker version") {
                        steps {
			  echo '===verifying needed tools are available===='
			sh '''
			git --version
			docker --version
			'''
                }
        }

        stage("perform terraform initialisation & plan dev branch "){
            // when {
            //     branch "dev"
            // }
            steps{
                echo "========executing initialisation & plan on Dev========"
                withCredentials([string(credentialsId: 'aws_access_key_id', variable: 'AWS_ACCESS_KEY_ID'), string(credentialsId: 'aws_secret_access_key', variable: 'AWS_SECRET_ACCESS_KEY')]) {
                sh '''
                cd aws_projects/create_servers/; aws_access_key_id=$AWS_ACCESS_KEY_ID aws_secret_access_key=$AWS_SECRET_ACCESS_KEY terraform init
                aws_access_key_id=$AWS_ACCESS_KEY_ID aws_secret_access_key=$AWS_SECRET_ACCESS_KEY terraform plan -var-file=environments/dev.tfvars
                '''
                }
            }

            post{
                always{
                    echo "========always========"
                }
                success{
                    echo "========A executed successfully========"
                }
                failure{
                    echo "========A execution failed========"
                }
            }
        }

        // stage("perform terraform initialisation & plan master branch "){
        //     when {
        //         branch "master"
        //     }
        //     steps{
        //         echo "========executing initialisation & plan on Prod========"
        //         withCredentials([string(credentialsId: 'aws_access_key_id', variable: 'AWS_ACCESS_KEY_ID'), string(credentialsId: 'aws_secret_access_key', variable: 'AWS_SECRET_ACCESS_KEY')]) {
        //         sh '''
        //         cd aws_projects/create_servers/; aws_access_key_id=$AWS_ACCESS_KEY_ID aws_secret_access_key=$AWS_SECRET_ACCESS_KEY terraform init
        //         aws_access_key_id=$AWS_ACCESS_KEY_ID aws_secret_access_key=$AWS_SECRET_ACCESS_KEY terraform plan -var-file=environments/prod.tfvars
        //         '''
        //         }
        //     }

            post{
                always{
                    echo "========always========"
                }
                success{
                    echo "========A executed successfully========"
                }
                failure{
                    echo "========A execution failed========"
                }
            }
        }

        stage ("Get Approval") {
            steps {
                script {
                    def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'comfirm'] ])
                }
            }
        }
        
        stage("perform terraform apply dev branch "){
            // when {
            //     branch "dev"
            // }
            steps{
                echo "========performing terraform apply on Dev========"
                withCredentials([string(credentialsId: 'aws_access_key_id', variable: 'AWS_ACCESS_KEY_ID'), string(credentialsId: 'aws_secret_access_key', variable: 'AWS_SECRET_ACCESS_KEY')]) {
                sh 'cd aws_projects/create_servers/; aws_access_key_id=$AWS_ACCESS_KEY_ID aws_secret_access_key=$AWS_SECRET_ACCESS_KEY terraform apply -var-file=environments/dev.tfvars --auto-approve'
                }
            }
            post{
                always{
                    echo "========always========"
                }
                success{
                    echo "========A executed successfully========"
                }
                failure{
                    echo "========A execution failed========"
                }
            }
        }

        // stage("perform terraform apply master branch "){
        //     when {
        //         branch "master"
        //     }
        //     steps{
        //         echo "========performing terraform apply on Prod========"
        //         withCredentials([string(credentialsId: 'aws_access_key_id', variable: 'AWS_ACCESS_KEY_ID'), string(credentialsId: 'aws_secret_access_key', variable: 'AWS_SECRET_ACCESS_KEY')]) {
        //         sh 'cd aws_projects/create_servers/; aws_access_key_id=$AWS_ACCESS_KEY_ID aws_secret_access_key=$AWS_SECRET_ACCESS_KEY terraform apply -var-file=environments/prod.tfvars --auto-approve'
        //         }
        //     }
            post{
                always{
                    echo "========always========"
                }
                success{
                    echo "========A executed successfully========"
                }
                failure{
                    echo "========A execution failed========"
                }
            }
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}