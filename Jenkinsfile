node {
  stage('Git Checkout') {
    checkout scm
  }

  stage('Build') {
    echo "Building..."
    customImage = docker.build("deployr")
  }

  stage('Push') {
    echo "Pushing..."
    docker.withRegistry('https://127661622741.dkr.ecr.us-east-1.amazonaws.com', 'ecr:us-east-1:personal-ecr-credentials') {
      customImage.push("${env.BUILD_ID}")
      customImage.push("latest")
    }
  }
}