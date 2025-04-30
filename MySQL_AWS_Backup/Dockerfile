FROM ubuntu

#Install openssh-server.
RUN apt-get update && \
    apt-get install -y  openssh-server


#Create a new user.
RUN id -u remote_user || useradd remote_user && \
    echo "remote_user:1234" | chpasswd && \
    mkdir /home/remote_user/.ssh -p && \
    chmod 700 /home/remote_user/.ssh && \
    mkdir -p -m0755 /var/run/sshd


#Copy the remote-key into the container.
COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

#Set  permissions to access to the .ssh folder.
RUN chown remote_user:remote_user -R /home/remote_user/ && \
    chmod 400 /home/remote_user/.ssh/authorized_keys

#Generate ssh keys and 
RUN ssh-keygen -A

#Install mysql.
RUN apt install -y mysql-server

#Install aws cli.
RUN apt-get install -y \
    curl \
    unzip \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf aws awscliv2.zipi

#Start the SSH service.
CMD /usr/sbin/sshd -D





# --- This is the best practice to perform the same in a single command. ---
#RUN useradd remote_user && \
#    echo "1234" | passwd remote_user --stdin && \
#    mkdir /home/remote_user/.ssh && \
#     chmod 700 /home/remote_user/.ssh

