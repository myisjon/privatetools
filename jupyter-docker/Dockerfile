FROM centos:7
ENV container docker
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY init.sh /init.sh
COPY requirements.txt /requirements.txt
RUN /bin/bash /init.sh

CMD ["/bin/bash"]
