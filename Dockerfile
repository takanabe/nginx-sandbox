FROM nginx:1.13.12
COPY ./nginx/default-green.conf /etc/nginx/conf.d/default.conf
COPY ./nginx/green.conf /usr/share/nginx/html/index.html
