FROM google/dart:2.6.1
RUN apt-get update ; apt-get install bc
WORKDIR /usr/src/myapp
COPY . /usr/src/myapp
CMD ["bash", "ci.sh"]
