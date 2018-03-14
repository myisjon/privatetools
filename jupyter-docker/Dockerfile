FROM centos:7
ENV container=docker
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8
ENV PATH=$PATH:/opt/rh/rh-python36/root/bin

RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo && \
    yum update -y && \
    yum install -y https://mirrors.aliyun.com/centos/7.4.1708/extras/x86_64/Packages/centos-release-scl-rh-2-2.el7.centos.noarch.rpm && \
    yum install -y rh-python36

# install ipython[all] numpy scipy matplotlib pandas scikit-learn nltk
COPY requirements.txt /requirements.txt
RUN /opt/rh/rh-python36/root/bin/pip install -r /requirements.txt -i https://pypi.doubanio.com/simple/

# clean cache
COPY init.sh /init.sh
RUN /bin/bash /init.sh

CMD ["/bin/bash"]
