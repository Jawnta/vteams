"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Layout = void 0;
const react_1 = __importDefault(require("react"));
const Navbar_1 = require("./Navbar");
const Header_1 = require("./Header");
const Main_1 = require("./Main");
const Layout = () => {
    return (<>
            <Header_1.Header />
            <Navbar_1.Navbar />
            <Main_1.Main />
        </>);
};
exports.Layout = Layout;
