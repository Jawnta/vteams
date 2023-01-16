"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.fetchConn = void 0;
const mariadb_1 = __importDefault(require("mariadb"));
const conf_json_1 = __importDefault(require("./config/conf.json"));
const testConf_json_1 = __importDefault(require("./config/testConf.json"));
const productionConf_json_1 = __importDefault(require("./config/productionConf.json"));
let pool;
if (process.env.NODE_ENV === 'test') {
    pool = mariadb_1.default.createPool(testConf_json_1.default);
}
else if (process.env.NODE_ENV === 'production') {
    pool = mariadb_1.default.createPool(productionConf_json_1.default);
}
else {
    pool = mariadb_1.default.createPool(conf_json_1.default);
}
function fetchConn() {
    return __awaiter(this, void 0, void 0, function* () {
        const conn = yield pool.getConnection();
        console.log("Total connections: ", pool.totalConnections());
        console.log("Active connections: ", pool.activeConnections());
        console.log("Idle connections: ", pool.idleConnections());
        return conn;
    });
}
exports.fetchConn = fetchConn;
