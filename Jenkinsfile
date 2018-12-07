pipeline {
 agent any
 stages {
     
  stage('Checkout') {
   steps {
    git url: 'https://github.com/hakkiogretmen/myFirstNetCoreApplication.git', branch: 'master'
   }
  }
  stage('Prepare agent'){
         steps {
            ansiblePlaybook( 
                playbook : 'playbooks/testplaybook.yaml',
                become: true)
        }
    }
  stage('Restore PACKAGES') {
   steps {
    sh "dotnet restore"
   }
  }
  stage('Clean') {
   steps {
    sh 'dotnet clean'
   }
  }
  stage('Build') {
   steps {
    sh 'dotnet build --configuration Release'
   }
  }
	 stage('Copy DockerFile to Release folder') {
		 steps {
		  sh 'cp Dockerfile bin/Release/Dockerfile'
		  sh 'cp kubedeployment.yaml bin/Release/kubedeployment.yaml'
		 }
	 }	 
  stage('Archive') {
      steps {
		archive 'bin/Release/**'
      }
  }
 }
}
