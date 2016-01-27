# Using instructions from https://github.com/phusion/passenger-docker

# Use phusion/passenger-full as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/passenger-docker/blob/master/Changelog.md for
# a list of version numbers.
# OR live on the wild side and use latest
FROM phusion/passenger-ruby22
MAINTAINER David Parrish <daveparrish@tutanota.com>

# Set correct environment variables.
ENV HOME /root

# ============ Custom build code steps here =============

# Requirements to build gems for redmine
# nokogirl, rmagick, mysql
# Clean up apt
RUN apt-get update && \
apt-get -y install libxslt1-dev libxml2-dev && \
apt-get -y install imagemagick libmagickwand-dev && \
apt-get -y install libmysqlclient-dev && \
apt-get clean && \
rm -r /var/lib/apt/lists/*

# COPY redmine project
COPY redmine /home/app/redmine

# Build gems
RUN cd /home/app/redmine && bundle install --without development test

# Enable nginx
RUN rm -f /etc/service/nginx/down
