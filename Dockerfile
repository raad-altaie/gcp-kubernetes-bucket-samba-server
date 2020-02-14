FROM centos:7

# create buckets folders inside the container 
RUN mkdir -p /<bucket-name-1>
RUN mkdir -p /<bucket-name-2>


# move the setup script and make executable 
ADD setup.sh /usr/local/bin/run_script.sh
RUN chmod +x /usr/local/bin/run_script.sh

# install gcsfuse
ADD gcsfuse.repo /etc/yum.repos.d/gcsfuse.repo
RUN yum update -y
RUN yum install gcsfuse -y

# install samba
RUN yum install samba samba-common samba-client -y

# add samba config
ADD smb.conf /etc/samba/

EXPOSE 445/tcp

ENTRYPOINT ["/usr/local/bin/run_script.sh"]

CMD []