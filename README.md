1. On a Linux machine with Podman and git available, clone the cbc-app repository:
```
git clone https://github.com/wtout/cbc-app.git
```
2. Go to the cbc-app directory
```
cd cbc-app
```
4. Build the container image:
```
podman build -t cbc-app .
```
5. Tag the container image:
```
podman tag cbc-app registry-1.docker.io/wtout/cbc-app:1.0.0
```
6. Login to the container registry
```
podman login --authfile ${HOME}/.podman/auth.json registry-1.docker.io
```
7. Push the image to the container registry
```
podman push registry-1.docker.io/wtout/cbc-app:1.0.0 --authfile ${HOME}/.podman/auth.json
```
8. On a Linux machine with Podman available, create the Secrets directory with the following structure:
```
CBCSecrets/
└── .env
```
The **.env** file contains the **SECRET_KEY** parameter required by the app

9. On the Linux machine where the .env file is present, deploy the application
```
podman run -e $(cat CBCSecrets/.env) --name cbc-app -d -p 8000:8000 registry-1.docker.io/wtout/cbc-app:1.0.0
```
10. To check that the app is reachable from the internet, type the following address in your browser:
```
http://<public IP address of the host>:8000
```
_**NOTE**: Replace **registry-1.docker.io/wtout** with ***your own container registry***_