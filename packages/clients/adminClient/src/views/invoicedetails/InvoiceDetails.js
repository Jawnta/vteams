"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.InvoiceDetails = void 0;
const react_1 = __importDefault(require("react"));
require("../css/InvoiceDetails.css");
const InvoiceDetailsTable_1 = require("./InvoiceDetailsTable");
const react_router_dom_1 = require("react-router-dom");
const InvoiceDetails = () => {
    const location = (0, react_router_dom_1.useLocation)();
    const navigate = (0, react_router_dom_1.useNavigate)();
    const navigateBackToInvoices = () => {
        navigate(`/users/${location.state.user.id}/invoices`);
    };
    return (<div className="invoice-details-wrapper">
        <div className="invoice-details">
            <h1>Invoice details</h1>
            <h2 onClick={() => { navigateBackToInvoices(); }}>«</h2>
            <InvoiceDetailsTable_1.InvoiceDetailsTable data={location.state}/>

        </div>
        </div>);
};
exports.InvoiceDetails = InvoiceDetails;
