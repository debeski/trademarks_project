pipeline {
    agent any

    environment {
        // Set environment variables if needed
        DOCKER_IMAGE = "debeski/trademarks_app:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out the code...'
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker-compose build'
            }
        }
        stage('Run Migrations & Tests') {
            steps {
                echo 'Applying migrations...'
                sh 'docker-compose run web python manage.py migrate'
                // Optionally run your tests here, e.g.,
                // sh 'docker-compose run web python manage.py test'
            }
        }
        stage('Push Docker Image') {
            steps {
                echo 'Pushing Docker image...'
                // Login to Docker Hub if necessary
                // sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                // Build and push the image
                sh 'docker build -t $DOCKER_IMAGE .'
                sh 'docker push $DOCKER_IMAGE'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                // Example: restart docker-compose stack (or use Kubernetes, etc.)
                sh 'docker-compose down'
                sh 'docker-compose up -d'
            }
        }
    }
    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
