FROM beevelop/ionic AS ionic
# Create app directory
WORKDIR /usr/src/app

COPY package*.json ./

RUN npm i

COPY . .

RUN ionic build

## Run 
FROM nginx:alpine
#COPY www /usr/share/nginx/html
COPY --from=ionic  /usr/src/app/www /usr/share/nginx/html
