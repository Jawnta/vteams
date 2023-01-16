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
const react_1 = __importStar(require("react"));
function UpdateProfileForm(_a) {
    var props = __rest(_a, []);
    const [tempUser, setTempUser] = (0, react_1.useState)(props.user);
    (0, react_1.useEffect)(() => {
        setTempUser(props.user);
    }, []);
    const updateState = (key, value) => {
        setTempUser(Object.assign(Object.assign({}, tempUser), { [key]: value }));
    };
    const handleSubmit = (event) => {
        event.preventDefault();
    };
    function updateUserDetails(user) {
        return __awaiter(this, void 0, void 0, function* () {
            const requestOptions = {
                method: "PUT",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(user),
            };
            try {
                const response = yield fetch(`/users/${user.id}`, requestOptions);
                setTempUser(user);
            }
            catch (error) {
                console.error(error);
            }
        });
    }
    if (props.user) {
        return (<form>
                <label>Förnamn:
                    <input type="text" name="username" value={tempUser.first_name || ""} onChange={e => updateState("first_name", e.target.value)}/>
                </label>
                <label>Efternamn:
                <input type="text" name="surname" value={tempUser.last_name || ""} onChange={e => updateState("last_name", e.target.value)}/>
                </label>
                <label>Telfon:
                <input type="tel" name="phone" value={tempUser.phone_number || ""} onChange={e => updateState("phone_number", e.target.value)}/>
                </label>
                <label>Email:
                <input type="text" name="email" value={tempUser.email || ""} onChange={e => updateState("email", e.target.value)}/>
                </label>
                <button onClick={(e) => __awaiter(this, void 0, void 0, function* () {
                handleSubmit(e);
                yield updateUserDetails(tempUser);
            })}>Uppdatera profil
                </button>
            </form>);
    }
    return (<div>
            <p>Loading...</p>
        </div>);
}
exports.default = UpdateProfileForm;
