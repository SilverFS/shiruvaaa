FROM nginx:alpine
RUN apk update

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY . /usr/share/nginx/html

## Sets permissions for nginx user
RUN chown -R nginx:nginx /var/cache/nginx && \
        chown -R nginx:nginx /var/log/nginx && \
        chown -R nginx:nginx /etc/nginx/conf.d
RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid

## Run as nginx user
USER nginx