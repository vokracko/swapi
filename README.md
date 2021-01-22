# SWAPI
- Dockerized version of [phalt/swapi](https://github.com/phalt/swapi)

## Usage
### Locally
- Build and run the image: `docker-compose up --build`
- Interface is accesible on [localhost:8000](localhost:8000)

### Dockerhub
[vokracko/swapi](https://hub.docker.com/repository/docker/vokracko/swapi)

Usage in docker-compose:
```
  swapi:
    image: vokracko/swapi
    ports:
      - 8000:8000
```
