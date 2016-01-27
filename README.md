# Passenger Docker container for Redmine

This project builds a container for running Passenger as part of a Redmine web site stack.

This Dockerfile image is for building the time consumming compiles and downloads as a base image. Additional configuration and settings are configured in docker-compose and decompose.

Other parts include:

- mariadb image
- docker-compose for container orchestration
- decompose for configuration

See decompose project [redmine-decompose](https://github.com/dmp1ce/decompose-redmine).
