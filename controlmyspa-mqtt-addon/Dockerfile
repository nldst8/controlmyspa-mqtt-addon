FROM node:18-alpine

WORKDIR /app

# Kopieer de volledige ControlMySpa code
COPY controlmyspa/ /app/

# Installeer dependencies
RUN npm install --production

# Voeg run script toe
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
