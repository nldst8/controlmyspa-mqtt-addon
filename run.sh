#!/bin/sh

export CMS_USERNAME=$(bashio::config 'cms_username')
export CMS_PASSWORD=$(bashio::config 'cms_password')

export MQTT_HOST=$(bashio::config 'mqtt_host')
export MQTT_PORT=$(bashio::config 'mqtt_port')
export MQTT_USERNAME=$(bashio::config 'mqtt_username')
export MQTT_PASSWORD=$(bashio::config 'mqtt_password')

node index.js
