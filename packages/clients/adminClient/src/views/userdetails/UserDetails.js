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
exports.UserDetails = void 0;
const react_1 = __importStar(require("react"));
const react_router_dom_1 = require("react-router-dom");
require("../css/UserDetails.css");
const UserDetailsNav_1 = require("./UserDetailsNav");
const UserDetailsMain_1 = require("./UserDetailsMain");
const UserDetails = () => {
    const [user, setUser] = (0, react_1.useState)([]);
    const params = (0, react_router_dom_1.useParams)();
    (0, react_1.useEffect)(() => {
        const getUser = (id) => __awaiter(void 0, void 0, void 0, function* () {
            const response = yield fetch(`/users/${id}`);
            return yield response.json();
        });
        getUser(params.userId).then(r => setUser(r[0]));
    }, [params.userId]);
    return (<div className="user-details">
            <UserDetailsNav_1.UserDetailsNav 
    // @ts-ignore
    userId={params.userId}/>
            <div className="user-details-main">
            <UserDetailsMain_1.UserDetailsMain user={user} setUser={setUser} userId={params.userId}/>
            </div>
        </div>);
};
exports.UserDetails = UserDetails;
