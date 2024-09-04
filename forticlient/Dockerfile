FROM debian
RUN apt update && apt upgrade && apt install -y wget ppp iproute2 openssh-server
RUN ssh-keygen -t rsa -f /root/.ssh/id_rsa -q -N "" && mv /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys
RUN sed -i 's/AllowTcpForwarding no/AllowTcpForwarding yes/' /etc/ssh/sshd_config && rm -rf /var/cache/apk/* && echo root:passwd | chpasswd
RUN wget http://cdn.software-mirrors.com/forticlientsslvpn_linux_4.4.2328.tar.gz && tar -zxvf forticlientsslvpn_linux_4.4.2328.tar.gz
WORKDIR /forticlientsslvpn/64bit/helper
RUN sed -i 's/more "$base\/License.txt"//g' setup.linux.sh && echo -n Yes | ./setup.linux.sh

WORKDIR /
COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/bin/sh"]