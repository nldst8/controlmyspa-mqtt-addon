FROM node:18-alpine

RUN apk add --no-cache jq

WORKDIR /app

# Kopieer ALLE bestanden uit de add-on map
COPY . /app/

# Installeer dependencies
RUN npm install --production

# run.sh uitvoerbaar maken
RUN chmod +x /app/run.sh

CMD ["/app/run.sh"]
