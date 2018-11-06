# The builder from node image
FROM node:alpine as builder

# build-time variables 
# prod|sandbox its value will be come from outside 
ARG env=prod

# Move our files into directory name "app"
WORKDIR /app
COPY package.json /app/
RUN cd /app && npm install
COPY .  /app

# Build with $env variable from outside
RUN cd /app && npm run build --prod

# Build a small nginx image with static website
FROM nginx:1.13-alpine

RUN apk update \
 && apk add jq \
 && rm -rf /var/cache/apk/*

COPY nginx/default.conf /etc/nginx/conf.d/

COPY nginx/startup.sh /startup.sh
RUN chmod +x /startup.sh

COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80

CMD ["/startup.sh"]