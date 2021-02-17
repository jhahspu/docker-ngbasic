FROM node:15.0

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm build

FROM nginx

COPY --from=0 /app/dist/Ex5SimpleNgAppWorkflow /usr/share/nginx/html