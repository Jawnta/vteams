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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const react_1 = __importStar(require("react"));
const logo_svg_1 = __importDefault(require("./logo.svg"));
require("./css/App.css");
const login_1 = __importDefault(require("./components/login"));
const cookie_1 = __importDefault(require("./helperFunc/cookie"));
const profile_1 = __importDefault(require("./components/profile"));
const userTrips_1 = __importDefault(require("./components/userTrips"));
const userInvoices_1 = __importDefault(require("./components/userInvoices"));
const navBar_1 = __importDefault(require("./components/navBar"));
function App() {
    const authCookie = (0, cookie_1.default)('id_token');
    const [user, setUser] = (0, react_1.useState)();
    const [page, setPage] = (0, react_1.useState)('Profile');
    (0, react_1.useEffect)(() => {
        const getUser = () => __awaiter(this, void 0, void 0, function* () {
            const response = yield fetch(`/users/token/${authCookie}`);
            const jsonResp = yield response.json();
            setUser(jsonResp[0]);
        });
        getUser();
    }, []);
    function updatePage(pageToShow) {
        setPage(pageToShow);
    }
    if (!authCookie) {
        return <login_1.default />;
    }
    return (<div className="App">
            <header className="App-header">
                <img src={logo_svg_1.default} className="App-logo" alt="logo"/>
                <h1>Snålåk Main</h1>
                <navBar_1.default updatePage={updatePage}/>
            </header>
            <div>
            {{
            'Profile': <profile_1.default userData={user}/>,
            'Trips': <userTrips_1.default userData={user}/>,
            'Invoices': <userInvoices_1.default userData={user}/>
        }[page]}
            </div>
        </div>);
}
exports.default = App;
