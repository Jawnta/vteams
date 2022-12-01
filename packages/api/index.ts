import express from 'express';
import cookieParser from 'cookie-parser';
import log from 'morgan';
import cors from 'cors';
// import multer from 'multer';

import { routes } from "./routes";

// const upload = multer();
const app = express();
const PORT = process.env.PORT || 3000;
const NODE_ENV = process.env.NODE_ENV || 'development';

app.set('port', PORT);
app.set('env', NODE_ENV);

app.use(cors());
app.use(log('tiny'));

// parse application/json
app.use(express.json());

// parse raw text
app.use(express.text());

// parse application/x-www-form-urlencoded
app.use(express.urlencoded({extended: true}));
app.use(cookieParser());

// parse multipart/form-data
// app.use(upload.array());
app.use(express.static('public'));

app.use(cookieParser());


// require('./routes')(app); gammal
routes(app);

// catch 404
app.use((req, res) => {
    // log.error(`Error 404 on ${req.url}.`);
    res.status(404).send({status: 404, error: 'Not found'});
});

// catch errors
app.use((err: any, req: any, res: any) => {
    const status = err.status || 500;
    const msg = err.error || err.message;
    // log.error(`Error ${status} (${msg}) on ${req.method} ${req.url} with payload ${req.body}.`);
    res.status(status).send({status, error: msg});
});

module.exports = app;

//för test
export default app

app.listen(PORT, () => {
    console.log(
        `Express Server started on Port ${app.get(
            'port'
        )} | Environment : ${app.get('env')}`
    );
});
