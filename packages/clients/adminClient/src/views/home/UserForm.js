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
var __rest = (this && this.__rest) || function (s, e) {
    var t = {};
    for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p) && e.indexOf(p) < 0)
        t[p] = s[p];
    if (s != null && typeof Object.getOwnPropertySymbols === "function")
        for (var i = 0, p = Object.getOwnPropertySymbols(s); i < p.length; i++) {
            if (e.indexOf(p[i]) < 0 && Object.prototype.propertyIsEnumerable.call(s, p[i]))
                t[p[i]] = s[p[i]];
        }
    return t;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.UserForm = void 0;
const react_1 = __importStar(require("react"));
require("../css/UserForm.css");
const UserForm = (_a) => {
    var props = __rest(_a, []);
    const [filterId, setFilterId] = (0, react_1.useState)(0);
    const [filterFirstName, setFilterFirstName] = (0, react_1.useState)("");
    const [filterLastName, setFilterLastName] = (0, react_1.useState)("");
    const handleSubmit = (event) => {
        event.preventDefault();
        props.setUserId(filterId);
        props.setFirstName(filterFirstName);
        props.setLastName(filterLastName);
        props.setHasSearched(true);
        setFilterId(0);
        setFilterFirstName("");
        setFilterLastName("");
    };
    return (<div className="user-form">
                <form>
                    <div className="user-form-input-wrapper">
                        <div className="user-form-input">
                    <label>User id</label>
                    <input id="f_userId" placeholder="User id..." type="text" value={!filterId ? "" : filterId} onChange={(e) => setFilterId(+e.target.value)}/>
                        </div>
                        <div className="user-form-input">
                    <label>First name</label>
                    <input id="f_firstName" placeholder="First name..." type="text" value={filterFirstName} onChange={(e) => setFilterFirstName(e.target.value)}/>
                        </div>
                        <div className="user-form-input">
                    <label>Last name</label>
                    <input id="f_lastName" placeholder="Last name..." type="text" value={filterLastName} onChange={(e) => setFilterLastName(e.target.value)}/>
                    </div>
                    </div>

                    <div className="user-form-button">
                    <button onClick={(e) => { handleSubmit(e); }}>Search
                    </button>
                    </div>
                </form>

            </div>);
};
exports.UserForm = UserForm;
