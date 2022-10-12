pipeline {
  agent any
  tools {
   AUnit "1.10.12"
  }
  
	environment{
	registry="prasabale/java_project"
	registryCredential='dockerhub'
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
                	git 'http:////github.com/sabale1/gitlab1.git',
                 	echo 'Code Coverage'
                 	jacoco()
                    }
                     	
            }
    }

	stage('docker Image'){
		steps{
			script{
		 	sh "docker build -t prasabale/java_project."	
			}
			}
		}
		
stage('Registring image') {
		steps{
			script{
				docker.withRegistry('',registryCredential){
				//dockerImage.push()
				sh "docker push prasabale/java_project"
				}
			}
		}
	}


  }
	
}
