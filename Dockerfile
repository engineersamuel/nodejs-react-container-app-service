FROM node:16.13.0 as frontend
WORKDIR /frontend
# copy local frontend/ to docker
COPY frontend/ .
RUN npm install
RUN npm run build

FROM node:16.13.0 as backend
WORKDIR /backend
COPY backend/ .
COPY --from=frontend /frontend/build /backend/public
RUN npm install && npm run build

# --------------------------------------------
# https://docs.microsoft.com/en-us/azure/app-service/configure-custom-container?pivots=container-linux#enable-ssh
# --------------------------------------------
# ssh
ENV SSH_PASSWD "root:Docker!"
RUN apt-get update \
        && apt-get install -y --no-install-recommends dialog \
        && apt-get update \
	&& apt-get install -y --no-install-recommends openssh-server \
	&& echo "$SSH_PASSWD" | chpasswd

COPY sshd_config /etc/ssh/
COPY init.sh /usr/local/bin/

RUN chmod u+x /usr/local/bin/init.sh

ENV HOST 0.0.0.0

EXPOSE 3000 2222

ENTRYPOINT ["init.sh"]
# --------------------------------------------

# ENV HOST 0.0.0.0

# EXPOSE 3000 2222

# CMD ["node", "./index.js"]