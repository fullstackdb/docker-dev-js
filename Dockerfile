FROM node:9.10.0-alpine

# create a folder
RUN mkdir -p /usr/src/app

# set the working dir, ./, . will refer to this dir
WORKDIR /usr/src/app

# just copy everything,
COPY . .

# run the install
RUN yarn && \
    chmod +x entrypoint.sh

EXPOSE 8080 9229
ENTRYPOINT [ "./entrypoint.sh" ]
