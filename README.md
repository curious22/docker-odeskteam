## docker-odeskteam

> Attempt to do a docker image with odeskteam app

Build: `docker build -t odesk .`

Attaching to an exciting container: `docker run --rm -ti odesk bash`

Run a container:
```
docker run -ti --rm \
       -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       odesk
```
