pipeline {
  agent any
  tools {
  ant 'php-intallar'
  }
  
	environment{
	DOCKER_TAG = getDockerTag()
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
			 sh "chmod +x changeTag.sh"
			 sh "./changeTag.sh ${DOCKER_TAG}"
		 }
		}
			


