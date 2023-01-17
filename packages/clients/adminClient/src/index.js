"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const react_dom_1 = __importDefault(require("react-dom"));
const react_1 = require("react");
const react_router_dom_1 = require("react-router-dom");
const Layout_1 = require("./components/layout/Layout");
const Map_1 = require("./views/map/Map");
const Home_1 = require("./views/home/Home");
const NoPage_1 = require("./views/NoPage");
const Login_1 = require("./components/login/Login");
const UserDetails_1 = require("./views/userdetails/UserDetails");
const UserDetailsInvoices_1 = require("./views/userdetails/UserDetailsInvoices");
const UserDetailsForm_1 = require("./views/userdetails/UserDetailsForm");
const InvoiceDetails_1 = require("./views/invoicedetails/InvoiceDetails");
const Scooters_1 = require("./views/scooters/Scooters");
const ScooterDetails_1 = require("./views/scooterdetails/ScooterDetails");
function App() {
    const [token, setToken] = (0, react_1.useState)();
    (0, react_1.useEffect)(() => {
        setToken(localStorage.getItem("token"));
    }, []);
    if (!token) {
        return <Login_1.Login setToken={setToken}/>;
    }
    return (<react_router_dom_1.BrowserRouter>
            <react_router_dom_1.Routes>
                <react_router_dom_1.Route path="/" element={<Layout_1.Layout />}>
                    <react_router_dom_1.Route index element={<Home_1.Home />}/>
                    <react_router_dom_1.Route path="map" element={<Map_1.Map />}/>
                    <react_router_dom_1.Route path='users/:userId' element={<UserDetails_1.UserDetails />}>
                        <react_router_dom_1.Route path='overview' element={<UserDetailsForm_1.UserDetailsForm />}/>
                        <react_router_dom_1.Route path='invoices' element={<UserDetailsInvoices_1.UserDetailsInvoices />}/>
                    </react_router_dom_1.Route>
                    <react_router_dom_1.Route path="invoiceDetails" element={<InvoiceDetails_1.InvoiceDetails />}/>
                    <react_router_dom_1.Route path="scooters" element={<Scooters_1.Scooters />}/>
                    <react_router_dom_1.Route path="scooterDetails" element={<ScooterDetails_1.ScooterDetails />}/>
                <react_router_dom_1.Route />

                    <react_router_dom_1.Route path="*" element={<NoPage_1.NoPage />}/>
                </react_router_dom_1.Route>
            </react_router_dom_1.Routes>
        </react_router_dom_1.BrowserRouter>);
}
exports.default = App;
react_dom_1.default.render(<App />, document.getElementById("root"));
