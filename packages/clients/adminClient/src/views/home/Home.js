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
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Home = void 0;
const react_1 = __importStar(require("react"));
require("../css/Home.css");
const UserTable_1 = require("./UserTable");
const UserForm_1 = require("./UserForm");
const Home = () => {
    const [users, setUsers] = (0, react_1.useState)([]);
    const [hasSearched, setHasSearched] = (0, react_1.useState)(false);
    const [userId, setUserId] = (0, react_1.useState)("");
    const [firstName, setFirstName] = (0, react_1.useState)("");
    const [lastName, setLastName] = (0, react_1.useState)("");
    (0, react_1.useEffect)(() => {
        const getAllUsers = () => __awaiter(void 0, void 0, void 0, function* () {
            const response = yield fetch(`/users/`);
            return yield response.json();
        });
        getAllUsers().then(r => setUsers(r));
    }, []);
    return (<div className="home-wrapper">
        <UserForm_1.UserForm setHasSearched={setHasSearched} setUserId={setUserId} setFirstName={setFirstName} setLastName={setLastName}/>

            {<UserTable_1.UserTable hasSearched={hasSearched} setHasSearched={setHasSearched} users={users} userId={userId} firstName={firstName} lastName={lastName}/>}
        </div>);
};
exports.Home = Home;
