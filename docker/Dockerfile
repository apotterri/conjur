FROM <base>

ADD id_rsa.pub /tmp/key.pub
RUN mkdir -p /root/.ssh && cat /tmp/key.pub >> /root/.ssh/authorized_keys && rm -f /tmp/key.pub
EXPOSE 22

ADD conjur.conf /etc/

ADD cookbooks.tar.gz /var/chef
RUN chef-solo -o conjur::install
