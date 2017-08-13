FROM centos:centos7

# update and install packages
RUN yum update -y && \
    yum install git gcc-c++ glibc-headers openssl openssl-devel readline libyaml-devel readline-devel zlib zlib-devel bzip2 sqlite-devel -y

# install nodejs
RUN rpm -i https://rpm.nodesource.com/pub_6.x/el/7/x86_64/nodesource-release-el7-1.noarch.rpm && \
    yum install nodejs -y

# rails setup
RUN adduser -m rails
ADD bin/rails_setup.sh /usr/local/bin/rails_setup.sh
RUN chmod 744 /usr/local/bin/rails_setup.sh
RUN /usr/local/bin/rails_setup.sh
# ADD conf/home/rails/Gemfile /home/rails/Gemfile
# RUN chown rails:rails /home/rails/Gemfile

# app volumes
VOLUME /home/rails/app/

EXPOSE 3000

CMD ["/sbin/init"]
