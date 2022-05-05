# Docker Alpine with rbenv and nodenv

DockerHub: https://hub.docker.com/r/amkisko/alpine-rbenv-nodenv

## Usage

```dockerfile
FROM amkisko/alpine-rbenv-nodenv

RUN nodenv install 16.0.0
RUN rbenv install 3.1.0 
RUN echo "Hello!"
```
