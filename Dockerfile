# Use an official Node.js runtime as a parent image
FROM node:20-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Use PORT environment variable, default to 3000 if not set
ENV PORT=3000

EXPOSE ${PORT}

CMD sh -c "node dist/cli.js --port ${PORT}"
