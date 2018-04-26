node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("yogiraj11/storeweb6")
    }
    
    stage('Run image'){
    sh "docker run -dit -p 8000:8000 yogiraj11/storeweb6"
    }
    
  }
