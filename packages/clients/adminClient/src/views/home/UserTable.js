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
exports.UserTable = void 0;
const react_1 = __importDefault(require("react"));
require("../css/UserTable.css");
const react_router_dom_1 = require("react-router-dom");
const dayjs_1 = __importDefault(require("dayjs"));
const UserTable = (_a) => {
    var props = __rest(_a, []);
    if (props.hasSearched) {
    }
    const checkFilter = () => {
        const filtersToApply = [];
        if (props.userId) {
            filtersToApply.push((user) => user.id === props.userId);
        }
        if (props.firstName) {
            filtersToApply.push((user) => user.first_name.toLowerCase().includes(props.firstName.toLowerCase()));
        }
        if (props.lastName) {
            filtersToApply.push((user) => user.last_name.toLowerCase().includes(props.lastName.toLowerCase()));
        }
        props.users = props.users.filter((item) => filtersToApply.every((fn) => fn(item)));
        if (filtersToApply.length === 0) {
            props.setHasSearched(false);
        }
    };
    const navigate = (0, react_router_dom_1.useNavigate)();
    const navigateUserDetails = (id) => {
        navigate(`/users/${id}/overview`);
    };
    const updateUserTable = () => {
        checkFilter();
        return props.users.map((user, index) => {
            return (<tr key={index} onClick={() => { navigateUserDetails(user.id); }}>
                    <td>{user.id}</td>
                    <td>{user.first_name}</td>
                    <td>{user.last_name}</td>
                    <td>{user.phone_number}</td>
                    <td>{user.email}</td>
                    <td>{(0, dayjs_1.default)(user.register_date).format("YYYY-MM-DD").toString()}</td>
                    <td>{user.social_security}</td>
                </tr>);
        });
    };
    return (<div className="user-table-wrapper">
            <div className="user-table">
                <table>
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>First name</th>
                        <th>Last name</th>
                        <th>Phone number</th>
                        <th>Email</th>
                        <th>Register date</th>
                        <th>Social security</th>

                    </tr>
                    </thead>
                    <tbody>
                    {!props.hasSearched ? (<tr />) : updateUserTable()}

                    </tbody>
                </table>
            </div>
            </div>);
};
exports.UserTable = UserTable;
