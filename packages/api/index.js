"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const express_session_1 = __importDefault(require("express-session"));
const dotenv = __importStar(require("dotenv"));
dotenv.config();
const morgan_1 = __importDefault(require("morgan"));
const cors_1 = __importDefault(require("cors"));
const passport_1 = __importDefault(require("passport"));
// import multer from 'multer';
const routes_1 = require("./routes");
// const upload = multer();
const app = (0, express_1.default)();
// const PORT = process.env.PORT || 3000;
const NODE_ENV = process.env.NODE_ENV || 'development';
// app.set('port', PORT);
app.set('env', NODE_ENV);
app.use((0, cors_1.default)());
app.use((0, morgan_1.default)('tiny'));
// parse application/json
app.use(express_1.default.json());
// parse raw text
app.use(express_1.default.text());
// parse application/x-www-form-urlencoded
app.use(express_1.default.urlencoded({ extended: true }));
// app.use(cookieParser());
// parse multipart/form-data
// app.use(upload.array());
app.use(express_1.default.static('public'));
// app.use(cookieParser());
//Middleware
app.use((0, express_session_1.default)({
    secret: "snalaksecret",
    resave: false,
    saveUninitialized: true,
    cookie: {
        sameSite: "lax"
    }
}));
app.use(passport_1.default.initialize());
app.use(passport_1.default.session());
// require('./routes')(app); gammal
(0, routes_1.routes)(app);
// catch 404
app.use((req, res) => {
    // log.error(`Error 404 on ${req.url}.`);
    res.status(404).send({ status: 404, error: 'Not found' });
});
// catch errors
app.use((err, req, res) => {
    const status = err.status || 500;
    const msg = err.error || err.message;
    // log.error(`Error ${status} (${msg}) on ${req.method} ${req.url} with payload ${req.body}.`);
    res.status(status).send({ status, error: msg });
});
//för test
exports.default = app;
