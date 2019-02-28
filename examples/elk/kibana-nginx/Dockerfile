from ubuntu:18.04
run apt update && apt install -y --no-install-recommends apache2-utils nginx

ADD entrypoint.sh /entrypoint.sh
ADD nginx.conf /etc/nginx/sites-available/default

#ENTRYPOINT ["/bin/bash", "-c", "/entrypoint.sh"]
ENTRYPOINT [ "/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]

