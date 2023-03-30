# Ryan Koch: Project 4

## CI Project Overview

This project uses docker and nginx to create an image to host a website.

## Part 1: Requirements and Running a Container
- Docker desktop installed from [docker.com](https://www.docker.com/)
- Image building: docker build -t mysite:1.0 .
- Image run: docker run -it --rm -d -p 8080:80 --name web mysite:1.0        
- View site: with image running [site](http://localhost:8080/)

## Part 2: GitHub Actions and DockerHub
- Public Repo creation: Requires account at [hub.docker.com](hub.docer.com)
    - From home, click create repository
    - Give repository a unique name and brief descrition describing purpose of the image
- Authenticate with DockerHub
    recommended using Access tokens
    - Go to Account settings -> Security
    - Select "New Access Token"
    - Give a discription and Access permissions (Recommended: Read/Write only)
        - generate token. NOTE: COPY AND SAVE TOKEN IMMEDIATELY!
    - Run `docker login -u username`
    - For password, use generated token
- Push Container
    - `docker push accountName/repository:tagNumber`
- GitHub Secrets
    - From the repository
        - Settings -> Secrets and Variables -> Actions
        - Click green "New repository secret" button
        - Give the secret a name and list the secret
        - Click "Add Secret"
    - This Project's Secrets:
        - DOCKER_PASSWORD: contains password to docker user account
        - DOCKER_USERNAME: username of docker account (koch64)
    - Github Workflow Behavior
        - Custom Variables:
            - DOCKER_HUB_REPO
            - secrets.DOCKER_USERNAME
            - secrets.DOCKER_PASSWORD
        - Action:
            - checkout the github repository
            - Create a new Docker builder
            - Login to DockerHub using secrets.DOCKER_USERNAME and secrets.DOCKER_PASSWORD
            - Build image and push to DockerHub repository
            
            


		
