FROM ubuntu

#Install openssh-server.
RUN apt-get update && \
    apt-get install -y  openssh-server


#Create a new user.
RUN id -u remote_user || useradd remote_user


#Set a password to the new user.
#	THIS IS ONLY FOR TESTING, EXPOSED PASSWORD!
RUN echo "remote_user:1234" | chpasswd

#Create a new folder to store the .ssh credentials.
RUN mkdir /home/remote_user/.ssh -p

#Set permissions only for that user.
RUN chmod 700 /home/remote_user/.ssh

#Create the ssh folder.
RUN mkdir -p -m0755 /var/run/sshd

#Copy the remote-key into the container.
COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

#Set  permissions to access to the .ssh folder.
RUN chown remote_user:remote_user -R /home/remote_user/

#Set permissions to read only.
RUN chmod 400 /home/remote_user/.ssh/authorized_keys

#Generate a SSH key.
RUN ssh-keygen -A

#Start the SSH service.
CMD /usr/sbin/sshd -D





# --- This is the best practice to perform the same in a single command. ---
#RUN useradd remote_user && \
#    echo "1234" | passwd remote_user --stdin && \
#    mkdir /home/remote_user/.ssh && \
#     chmod 700 /home/remote_user/.ssh

