FROM nginx:1.13.12
COPY ./nginx/default-blue.conf /etc/nginx/conf.d/default.conf
COPY ./nginx/blue.conf /usr/share/nginx/html/index.html
