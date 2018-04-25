node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("yogiraj11/storeweb1")
    }
    
    stage('Run image'){
    sh "docker run -p 8000:8000 -it yogiraj11/storeweb1"
    }
    
  }
