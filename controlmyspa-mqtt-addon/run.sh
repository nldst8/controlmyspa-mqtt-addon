#!/bin/sh

CONFIG_PATH=/data/options.json

export CMS_USERNAME=$(jq -r '.cms_username' $CONFIG_PATH)
export CMS_PASSWORD=$(jq -r '.cms_password' $CONFIG_PATH)

export MQTT_HOST=$(jq -r '.mqtt_host' $CONFIG_PATH)
export MQTT_PORT=$(jq -r '.mqtt_port' $CONFIG_PATH)
export MQTT_USERNAME=$(jq -r '.mqtt_username' $CONFIG_PATH)
export MQTT_PASSWORD=$(jq -r '.mqtt_password' $CONFIG_PATH)

echo "Starting ControlMySpa MQTT Bridge..."
node /app/index.js
