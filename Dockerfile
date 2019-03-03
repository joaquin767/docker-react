# Start of builder phase

FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

# End of builder phase

# Start of run phase

FROM nginx
COPY  --from=builder /app/build /usr/share/nginx/html