FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y libqt4-designer libqt4-opengl libqt4-svg libqtgui4 && \
    apt-get install -y libqtwebkit4 libgstreamer-plugins-base0.10-0 libnotify4 libqt4-dbus libxss1

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

ENV HOME /home/developer
COPY odeskteam_3.2.59_ubuntu_12.04_amd64.deb ${HOME}/
RUN dpkg -i ${HOME}/odeskteam_3.2.59_ubuntu_12.04_amd64.deb

USER developer

CMD /usr/bin/odeskteam-qt4
