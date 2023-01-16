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
Object.defineProperty(exports, "__esModule", { value: true });
function ProfileCard(_a) {
    var props = __rest(_a, []);
    if (props.userData) {
        return (<div className="profileCard">
                <p>Förnamn: {props.userData.first_name}</p>
                <p>Efternamn: {props.userData.last_name}</p>
                <p>Telfon: {props.userData.phone_number}</p>
                <p>Email: {props.userData.email}</p>
                <p>Personnummer: {props.userData.social_security}</p>
                <p>Kredit: {props.userData.credit} kr</p>
            </div>);
    }
    return (<div>
            <p>Loading...</p>
        </div>);
}
exports.default = ProfileCard;
