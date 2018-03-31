FROM node:alpine
RUN mkdir -p /var/www && \
    npm i -g nodemon && \
    npm -v
WORKDIR /var/www

CMD [ "nodemon index.js localhost 8080" ]