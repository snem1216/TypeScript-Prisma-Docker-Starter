# Build JS
FROM node:lts-alpine as build
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npx prisma generate
RUN npm run build

# Normal run
FROM node:lts-alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
COPY . .
COPY --from=build /usr/src/app/dist ./dist
RUN chown -R node /usr/src
USER node
RUN npm install --production --silent && mv node_modules ../
RUN npx prisma generate
CMD ["npm", "run", "migrate:start:prod"]
