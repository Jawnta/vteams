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
exports.UserDetailsForm = void 0;
const react_1 = __importDefault(require("react"));
require("../css/UserDetailsForm.css");
const UserDetailsEndpoints_1 = require("../../endpoints/UserDetailsEndpoints");
const react_router_dom_1 = require("react-router-dom");
const dayjs_1 = __importDefault(require("dayjs"));
const UserDetailsForm = () => {
    //@ts-ignore
    const [user, setUser] = (0, react_router_dom_1.useOutletContext)();
    const updateUserDetails = (user) => __awaiter(void 0, void 0, void 0, function* () {
        yield (0, UserDetailsEndpoints_1.updateUser)(user);
    });
    const handleSubmit = (event) => __awaiter(void 0, void 0, void 0, function* () {
        event.preventDefault();
    });
    const updateState = (key, value) => {
        setUser(Object.assign(Object.assign({}, user), { [key]: value }));
    };
    return (<div className="user-details-form">
            <form>
                <div className="user-details-input-wrapper">
                <div className="user-details-input">
                <label>User id</label>
                <input id="f_userId" placeholder="User id..." type="text" value={user.id} onChange={e => updateState("id", e.target.value)}/>
                </div>
                <div className="user-details-input">
                <label>First name</label>
                <input id="f_firstName" placeholder="First name..." type="text" value={user.first_name} onChange={e => updateState("first_name", e.target.value)}/>
                </div>
                <div className="user-details-input">
                <label>Last name</label>
                <input id="f_lastName" placeholder="Last name..." type="text" value={user.last_name} onChange={e => updateState("last_name", e.target.value)}/>
                </div>
                <div className="user-details-input">
                <label>Phone number</label>
                <input id="f_phoneNumber" placeholder="Phone number..." type="text" value={user.phone_number} onChange={e => updateState("phone_number", e.target.value)}/>
                </div>
                <div className="user-details-input">
                <label>Email</label>
                <input id="f_email" placeholder="Email..." type="text" value={user.email} onChange={e => updateState("email", e.target.value)}/>
                </div>
                <div className="user-details-input">
                <label>Register date</label>
                <input id="f_registerDate" placeholder="Register date..." type="text" value={(0, dayjs_1.default)(user.register_date).format("YYYY-MM-DD").toString()} onChange={e => updateState("register_date", e.target.value)}/>
                </div>
                    <div className="user-details-input">
                <label>Social security number</label>
                <input id="f_socialSecurity" placeholder="Social security number..." type="text" value={user.social_security} onChange={e => updateState("social_security", e.target.value)}/>
                </div>
                <div className="user-details-input">
                <label>Active</label>
                <input id="f_active" placeholder="Last name..." type="text" value={user.active ? "No" : "Yes"} onChange={e => updateState("active", e.target.value)}/>
                </div>
                <div className="user-details-input">
                <label>Balance</label>
                <input id="f_credit" placeholder="Balance..." type="text" value={user.credit} onChange={e => updateState("credit", e.target.value)}/>
                </div>
                </div>

                <div className="user-details-button">
                <button onClick={(e) => __awaiter(void 0, void 0, void 0, function* () { yield handleSubmit(e); yield updateUserDetails(user); })}>Update customer
                </button>
                </div>
            </form>

        </div>);
};
exports.UserDetailsForm = UserDetailsForm;
