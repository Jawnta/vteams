# This is the base dockerfile. Here the base image is pulled and the ras setup is done for the project.
# Make sure to include the base setup for lerna here.
FROM node:16 as base
WORKDIR /app
COPY ./package.json ./
RUN npm install
COPY ./lerna.json ./
# Package userclient
FROM base as userclient-build
WORKDIR /app/packages/clients/userClient
# Here the dependencies will be installed and the local required packages bootstrapped.
# The --slim flag will cause the package json to only include the dependencies, so not all changes to the package json cause docker to reinstall all packages.
COPY  packages/clients/userClient/package-slim.json package.json
WORKDIR /app/
RUN npx lerna bootstrap --scope=userclient --includeDependencies
WORKDIR /app/packages/clients/userClient
# The normal package.json should be copied after the install into the container
COPY  packages/clients/userClient/package.json ./
# This will only add the command to the dockerfile if the build script exists in the package otherwise its ignored.
RUN npm run build
# Package adminclient
FROM node:16-alpine as adminclient-build
WORKDIR /app/packages/clients/adminClient
# ENV NODE_ENV production
# WORKDIR /adminClient
COPY  packages/clients/adminClient .
WORKDIR /app/
RUN npx lerna bootstrap --scope=adminclient --includeDependencies --ci
WORKDIR /app/packages/clients/adminClient
# #EXPOSE 1338
RUN npm run build
# # Bundle static assets with nginx
FROM nginx:1.21.0-alpine as adminclient-production
WORKDIR /app/packages/clients/adminClient
# ENV NODE_ENV production
FROM builder as adminclient-2
WORKDIR /app/packages/clients/adminClient
COPY --from=adminclient-build  /adminClient/build /usr/share/nginx/html
# # Add your nginx.conf
COPY  packages/clients/adminClient/nginx.conf /etc/nginx/conf.d/default.conf
# # Expose port
# EXPOSE 1338
# # Start nginx
# CMD ["nginx", "-g", "daemon off;"]
# ÖVER ÄR FÖR PRODUCTION
FROM node:16-alpine as adminclient-3
WORKDIR /app/packages/clients/adminClient
WORKDIR /adminClient
COPY  packages/clients/adminClient/package*.json ./
WORKDIR /app/
RUN npx lerna bootstrap --scope=adminclient --includeDependencies
WORKDIR /app/packages/clients/adminClient
COPY  packages/clients/adminClient ./
EXPOSE 1338
ENTRYPOINT ["npm", "start"]
# Package snlk
FROM node:16-alpine as snlk-0
WORKDIR /app/packages/api
WORKDIR /api
COPY  packages/api/package*.json ./
WORKDIR /app/
RUN npx lerna bootstrap --scope=snlk --includeDependencies
WORKDIR /app/packages/api
COPY  packages/api ./
# For deploy
RUN npm run build
ENTRYPOINT [ "npm" ]
CMD [ "run", "dev" ]
# lägg till dev script: i npm i api
# "dev": "concurrently \"npx tsc --watch\" \"nodemon -q dist/index.js\""
# final stage
FROM base
COPY --from=userclient-build /app/packages/clients/userClient /app/packages/clients/userClient
COPY --from=adminclient-3 /app/packages/clients/adminClient /app/packages/clients/adminClient
COPY --from=snlk-0 /app/packages/api /app/packages/api