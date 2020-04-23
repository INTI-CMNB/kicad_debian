# kicad_debian

Docker image for KiCad on Debian GNU/Linux.

The main objetive is to use it as a base for KiCad automation in CI/CD environments.

The images are uploaded to [Docker Hub](https://hub.docker.com/repository/docker/setsoft/kicad_debian).

The current tags are:

* **10.3-5.0.2** is Debian 10.3 + KiCad 5.0.2 (default stable)
* **10.3-5.1.5** (same as **latest**) is Debian 10.3 + KiCad 5.1.5 (backport)

The installations are minimal, but contains schematic and footprint libraries.
The 3D models aren't included, they weight 10 times the size of these images.

If you want to run interactively use:

```
export USER_ID=$(id -u)
export GROUP_ID=$(id -g)
docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
    --user $USER_ID:$GROUP_ID \
    --env NO_AT_BRIDGE=1 \
    --workdir="/home/$USER" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/home/$USER:/home/$USER:rw" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/home/$USER:/home/$USER:rw" \
    setsoft/kicad_auto:10.3-5.1.5 kicad
