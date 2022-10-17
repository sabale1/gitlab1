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
			clover PHP()
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
	
stage('Deploy to K8s')
		{
	         steps{
				script{
			 sh "chmod +x changeTag.sh"
					sh "./changeTag.sh"
			 sshagent(['minikube']){
				 sh "scp ./service.yml root@192.168.26.128:/root" 
	                   script {
				try {
				      sh " ssh root@192.168.26.128 kubectl apply -f ."
					 }catch(error){
				      sh " ssh root@192.168.26.128 kubectl create -f ."
                                   }
								}
						}
					}	
				}
			
			}
		
	}
}

