import express from 'express';
import session from 'express-session';
import * as dotenv from 'dotenv'
dotenv.config()
import cookieParser from 'cookie-parser';
import log from 'morgan';
import cors from 'cors';
import passport from 'passport';
// import multer from 'multer';
import { routes } from "./routes";
// const upload = multer();
const app = express();
// const PORT = process.env.PORT || 3000;
const NODE_ENV = process.env.NODE_ENV || 'development';
// app.set('port', PORT);
app.set('env', NODE_ENV);
app.use(cors());
app.use(log('tiny'));
// parse application/json
app.use(express.json());
// parse raw text
app.use(express.text());

// parse application/x-www-form-urlencoded
app.use(express.urlencoded({extended: true}));
// app.use(cookieParser());

// parse multipart/form-data
// app.use(upload.array());
app.use(express.static('public'));

// app.use(cookieParser());
//Middleware
app.use(session({
    secret: "snalaksecret",
    resave: false ,
    saveUninitialized: true ,
    cookie: {
        sameSite: "lax"
    }

}))
app.use(passport.initialize())
app.use(passport.session())
// require('./routes')(app); gammal
// versions(app)
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

//för test
export default app

