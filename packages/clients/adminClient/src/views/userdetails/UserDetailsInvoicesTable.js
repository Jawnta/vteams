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
exports.UserDetailsInvoicesTable = void 0;
const react_1 = __importDefault(require("react"));
require("../css/UserTable.css");
const react_router_dom_1 = require("react-router-dom");
const dayjs_1 = __importDefault(require("dayjs"));
const UserDetailsInvoicesTable = (_a) => {
    var props = __rest(_a, []);
    let invoice = {};
    const navigate = (0, react_router_dom_1.useNavigate)();
    const navigateUserDetails = (id, billed, trip_id, amount, payed) => {
        invoice = {
            id: id,
            billed: billed,
            trip_id: trip_id,
            amount: amount,
            payed: payed
        };
        navigate('/invoiceDetails', { state: { invoice: invoice, user: props.user } });
    };
    const updateInvoiceTable = () => {
        return props.invoices.map((invoice, index) => {
            return (<tr key={index} onClick={() => {
                    navigateUserDetails(invoice.id, invoice.billed, invoice.trip_id, invoice.amount, invoice.payed);
                }}>
                    <td>{invoice.id}</td>
                    <td>{(0, dayjs_1.default)(invoice.billed).format("YYYY-MM-DD").toString()}</td>
                    <td>{invoice.trip_id}</td>
                    <td>{invoice.amount}</td>
                    <td>{invoice.payed}</td>

                </tr>);
        });
    };
    return (<div className="user-table-wrapper">
            <div className="user-table">
                <table>
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Billed</th>
                        <th>Trip id</th>
                        <th>Amount</th>
                        <th>Payed</th>

                    </tr>
                    </thead>
                    <tbody>
                    {updateInvoiceTable()}

                    </tbody>
                </table>
            </div>
        </div>);
};
exports.UserDetailsInvoicesTable = UserDetailsInvoicesTable;
