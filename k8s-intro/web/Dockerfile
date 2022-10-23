FROM nginx

RUN apt-get update && apt-get upgrade -y && mkdir /app

COPY custom.html /app
COPY default.conf /etc/nginx/conf.d/default.conf 

WORKDIR /app
EXPOSE 8000

CMD ["nginx", "-g", "daemon off;"]
