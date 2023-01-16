"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const index_1 = __importDefault(require("./index"));
const PORT = process.env.PORT || 3000;
index_1.default.set('port', PORT);
index_1.default.listen(PORT, () => {
    console.log(`Express Server started on Port ${index_1.default.get('port')} | Environment : ${index_1.default.get('env')}
        `);
});
