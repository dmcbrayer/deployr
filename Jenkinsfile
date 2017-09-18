node {
  stage('Git Checkout') {
    checkout scm
  }

  stage('Build') {
    echo "Building..."
    def customImage = docker.build("deployr:${env.BUILD_ID}")
  }
}