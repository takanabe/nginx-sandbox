FROM nginx:1.13.12
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
# blue apps
#COPY ./nginx/blue.conf /usr/share/nginx/html/index.html
# blue apps
COPY ./nginx/green.conf /usr/share/nginx/html/index.html
