import { CodeRegistryService } from "./code-registry-service";

const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 4000;

app.use(bodyParser.urlencoded({ extended: false }));

const service = new CodeRegistryService()

// http://localhost:4000/getContent
app.get('/getContent', async (req, res) => {
    const content = await service.getContent()
    res.send(content);
});

// http://localhost:4000/getLatestVersion
app.get('/getLatestVersion', async (req, res) => {
    const latestVersion = await service.getLatestVersion()
    res.send(latestVersion);
});


app.listen(port, () => {
    console.log(`Success! Your application is running at http://localhost:${port}.`);
});