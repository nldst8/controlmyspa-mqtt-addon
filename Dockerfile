FROM node:18-alpine

WORKDIR /app

RUN apk add --no-cache git

RUN git clone https://github.com/ccutrer/controlmyspa.git .

RUN npm install

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
