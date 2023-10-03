FROM nginx:mainline-alpine3.18-slim

# Update the image
RUN apk add --update 

# Configure the image
WORKDIR /frontend
RUN apk add nodejs
RUN apk add npm

# Install project dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy project code to the image 
COPY . .

# Building project
RUN npm run build
RUN mv dist/* /usr/share/nginx/html

# Cleaning
RUN rm -r *
RUN apk del nodejs 
RUN apk del npm

EXPOSE 80