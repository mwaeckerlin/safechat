# Run it:
# docker run -d -name safechat.ch-volumes mysql sleep infinity
# docker run -d -name safechat.ch-mysql 

FROM ubuntu
MAINTAINER mwaeckerlin

RUN apt-get install -y wget software-properties-common apt-transport-https
RUN apt-add-repository https://dev.marc.waeckerlin.org/repository
RUN wget -O- https://dev.marc.waeckerlin.org/repository/PublicKey \
    | apt-key add -
RUN apt-get update -y
RUN apt-get install safechat

RUN mkdir -p /usr/share/nginx
RUN ln -s /usr/share/safechat/html /usr/share/nginx/html

# Just provide /usr/share/safechat/html
VOLUME /usr/share/safechat/html
VOLUME /usr/share/nginx/html
CMD sleep infinity