# Project 4
# Ryan Koch


## CI Project Overview

This project uses docker and nginx to create an image to host a website. 

# Installation requirements
	- Docker desktop installed from [docker.com](https://www.docker.com/) 
	- Image building: docker build -t mysite:1.0 .
	- Image run: docker run -it --rm -d -p 8080:80 --name web mysite:1.0
	- View site: with image running [site](http://localhost:8080/)
		
