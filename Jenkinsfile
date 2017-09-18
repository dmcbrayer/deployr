node {
  stage('Git Checkout') {
    checkout scm
  }

  stage('Build') {
    echo "Building..."
    sh "sudo docker build -t deployr:${BUILD_ID} ."
  }
}