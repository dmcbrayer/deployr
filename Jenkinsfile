node {
  stage('Git Checkout') {
    checkout scm
  }

  stage('Build') {
    echo "Building..."
    def customImage = docker.build("deployr:${env.BUILD_ID}")
  }

  stage('Push') {
    echo "Pushing..."
    docker.withRegistry('https://127661622741.dkr.ecr.us-east-1.amazonaws.com', 'ecr:us-east-1:personal-ecr-credentials') {
      customImage.push("deployr:${env.BUILD_ID}")
      customImage.push("deployr:latest")
    }
  }
}