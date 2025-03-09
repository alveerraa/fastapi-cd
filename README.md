FastAPI Dockerized App
This repository contains a FastAPI application that is containerized using Docker and automated with GitHub Actions for continuous integration and deployment.

1. How to Install and Run Locally
Prerequisites
Ensure you have the following installed:

Python 3.10+
pip
Virtual Environment (venv)
Installation Steps
Clone the repository:
git clone https://github.com/yourusername/fastapi-docker-app.git
cd fastapi-docker-app

Create and activate a virtual environment:
python3 -m venv venv
source venv/bin/activate  # On macOS/Linux
venv\Scripts\activate  # On Windows

Install dependencies:
pip install --upgrade pip
pip install -r requirements.txt

Run the FastAPI application:
uvicorn main:app --host 0.0.0.0 --port 8000 --reload

Open your browser and navigate to:
http://127.0.0.1:8000


2. How to Build and Run the Docker Image
Building the Docker Image
Ensure Docker is installed and running.

Build the Docker image:
docker build -t fastapi-app .

Running the Docker Container
docker run -p 8000:8000 fastapi-app

Access the Application in Browser
http://localhost:8000


3. GitHub Actions Workflow Explanation
This repository uses GitHub Actions to automate building and pushing the Docker image to Docker Hub.

Workflow File (.github/workflows/DockerBuild.yml)
Triggers: Runs automatically on push events.
Jobs:
Checkout Repository: Pulls the latest code.
Login to Docker Hub: Authenticates using secrets.
Build Docker Image: Builds the container.
Push Docker Image: Uploads it to Docker Hub.

Workflow Steps:
name: Docker image build and push

on: push

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Log in to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}

      - name: Build Docker Image
        run: docker build -t yourusername/fastapi-app:latest .

      - name: Push Docker Image
        run: docker push yourusername/fastapi-app:latest

        
4. Steps for Setting Up Docker Token and Secrets
   
Create a Docker Hub Token
Log in to Docker Hub.
Navigate to Account Settings → Security.
Click New Access Token, give it a name, and copy it.
Add Secrets to GitHub
Go to GitHub Repository → Settings → Secrets and Variables → Actions.
Click New Repository Secret and add:
DOCKER_USERNAME = your Docker Hub username
DOCKER_PASSWORD = your Docker Hub token
