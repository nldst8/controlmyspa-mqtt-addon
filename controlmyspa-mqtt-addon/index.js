const axios = require("axios");
const mqtt = require("mqtt");

const CMS_USERNAME = process.env.CMS_USERNAME;
const CMS_PASSWORD = process.env.CMS_PASSWORD;

const MQTT_HOST = process.env.MQTT_HOST;
const MQTT_PORT = process.env.MQTT_PORT;
const MQTT_USERNAME = process.env.MQTT_USERNAME;
const MQTT_PASSWORD = process.env.MQTT_PASSWORD;

async function login() {
  const res = await axios.post("https://iot.controlmyspa.com/v1/login", {
    email: CMS_USERNAME,
    password: CMS_PASSWORD
  });

  return res.data.token;
}

async function getSpaState(token) {
  const res = await axios.get("https://iot.controlmyspa.com/v1/spas", {
    headers: { Authorization: `Bearer ${token}` }
  });

  return res.data;
}

async function main() {
  console.log("Connecting to MQTT…");

  const mqttClient = mqtt.connect({
    host: MQTT_HOST,
    port: MQTT_PORT,
    username: MQTT_USERNAME,
    password: MQTT_PASSWORD
  });

  mqttClient.on("connect", () => {
    console.log("MQTT connected");
  });

  const token = await login();
  console.log("Logged in to ControlMySpa");

  setInterval(async () => {
    const state = await getSpaState(token);
    mqttClient.publish("controlmyspa/state", JSON.stringify(state));
  }, 5000);
}

main();
