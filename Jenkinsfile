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
		  sh 'cp Dockerfile2 bin/Release/Dockerfile2'
		  sh 'cp kubedeployment.yaml bin/Release/kubedeployment.yaml'
		  sh 'cp wwwroot bin/Release/netcoreapp2.1/wwwroot'
		 }
	 }	 
  stage('Archive') {
      steps {
		archive 'bin/Release/**'
      }
  }
 }
}
