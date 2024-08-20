
## Generate basic auth password

htpasswd -c .htpasswd root

## Build and run

Note: I didn't find a way to inject the VNC_PASSWORD inside Dockerfile. Replace XXX with your pwd.

docker compose --env-file .env up --build

## Run in headless mode

docker compose up -d

## Browse novnc url

- http://localhost:6080
