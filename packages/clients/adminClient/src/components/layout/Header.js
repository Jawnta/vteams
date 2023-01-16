"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Header = void 0;
const react_1 = __importDefault(require("react"));
require("../css/Header.css");
const Header = () => {
    return (<div className="header">
            <h1>Snålåk Admin Client</h1>
        </div>);
};
exports.Header = Header;
