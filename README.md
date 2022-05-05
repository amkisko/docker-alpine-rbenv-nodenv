# Docker Alpine with rbenv and nodenv

DockerHub: https://hub.docker.com/r/amkisko/alpine-rbenv-nodenv

## Usage

```dockerfile
FROM amkisko/alpine-rbenv-nodenv

RUN apk add curl
RUN echo "Hello!"
```
