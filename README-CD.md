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
