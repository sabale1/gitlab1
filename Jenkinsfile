pipeline {
  agent any
  tools {
  ant 'php-intallar'
  }
  
	environment{
	registry="prasabale/java_project"
	registryCredential="dockerhub"
	//dockerImage=''
	}
	
    //each branch has 1 job running at a time
  options {
    disableConcurrentBuilds()  
  }

  stages{
	stage('Git') {
		steps{
		git 'http://github.com/sabale1/gitlab1.git'
		}	
	}
   
   stage('Code Coverage') {
        steps{
          	script {
                 	echo 'Code Coverage'
                    }
                     	
            }
    }

	stage('docker Image') {
		steps{
			script{
		 	sh 'docker build -t prasabale/php-project .'	
				}
			}
		} 
		
stage('Registring image') {
		steps{
			script{
				docker.withRegistry('',registryCredential){
				//dockerImage.push()
				sh 'docker push prasabale/php-project'
				}
			}
		}
	}


  }
	
}
stage('Deploy to K8s')
		{
			steps{
				sshagent(['k8s-jenkins'])
				{
					sh 'scp -r -o StrictHostKeyChecking=no node-deployment.yaml minikube@192.168.26.128:/home'
					
					script{
						 sh 'ssh minikube@192.168.26.128 kubectl apply -f /home/node-deployment.yaml --kubeconfig=/path/kube.yaml'
							
							} 
						        

						}
					}
				}


