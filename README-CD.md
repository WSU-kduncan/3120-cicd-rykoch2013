# Project 5 Documentation

### Project overview
- The goal of this project is to use github and docker to create tagged versions of a project. With these tagged versions, a webhook is created in an AWS instance that, when activated, will stop and remove the current running instance, pull the latest version, and restart the image.

## Part 1

- Generating tags
	- commit and push the current verion to GitHub
	- Tag the current version using major, minor, and patch tag as well as a comment desribing the current tag
	- `git tag -a v1.2.3 -m "notes about the tag"`
	- use `git tag origin v1.2.3` to push the tagged version to GitHub
- GitHub workflow
	- triggered on a push to main, or when tagged using form `v*.*.*`, but will only work for tagging.
	- checkouts runner for repo
	- generates docker metadata (repo and tag) 
	- builds docker image
	- logs into docker using the GitHub secrets for username and password
	- pushes the image to docker and tags the image with the tag given to GitHub

	 
## Part 2

- installing Docker on instance
	- install docker: `sudo apt install docker.io`
	- start docker service: `sudo serice docker start`
	- add ubuntu to group docker(for use without sudo): `sudo usermod -a -G docker ubuntu`
	- restart docker to allow for update: `sudo servicectl restart docker`

- Container Restart Script `filename`
	- pull latest image from Docker: `docker pull user\repository`
	- Stop the current active container: `docker stop project5`
	- remove container to allow for name reuse: `docker rm project5`
	- force remove any unused container `docker image prune -f`
	- run the pulled image detached over ports80:80 with name project5: ` docker run -p 80:80 -d --name project5 koch64/first_nginx_image`

- Setting up `webhook`

- `webhook` task definition file
	- Identifies and gives a list of commands when a signal is sent from docker to the webhook's html address
	- Generate an identifier: `"id": project5Webhook`
	- List  commands to be executed when notified: `"execute-command": "/home/ubuntu/3120-cicd-rykoch2013/deployment/pullScript.sh"`
	- list directory to execute commands within: `"command-working-directory": "/var/webhooks"`

- Docker listener messaging configuration
	- Go to repository on hub.docker and select webhooks
	- name webhook and set lister using format: http://, hostIP or name, port number, /hooks/ , hookName: `http://3.81.247.41:9000/hooks/project5Webhook`


