FROM tiangolo/node-frontend as build
WORKDIR /app
COPY package.json /app/
RUN npm i --only=production
COPY ./ /app/

RUN npm run build
FROM nginx:latest
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
