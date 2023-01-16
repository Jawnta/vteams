"use strict";
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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const profileCard_1 = __importDefault(require("./cards/profileCard"));
const updateProfileForm_1 = __importDefault(require("./forms/updateProfileForm"));
function Profile(_a) {
    var props = __rest(_a, []);
    if (!props.userData) {
        return (<h3>Loading</h3>);
    }
    return (<div className="profile">
            <div>
                <h1>Profil</h1>
                <profileCard_1.default userData={props.userData}/>
            </div>
            <div>
                <h1>Ändra</h1>
                <updateProfileForm_1.default user={props.userData}/>
            </div>
            
        </div>);
}
exports.default = Profile;
