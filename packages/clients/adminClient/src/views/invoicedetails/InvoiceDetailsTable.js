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
exports.InvoiceDetailsTable = void 0;
const react_1 = __importDefault(require("react"));
const dayjs_1 = __importDefault(require("dayjs"));
require("../css/InvoiceDetailsTable.css");
const InvoiceDetailsTable = (_a) => {
    var props = __rest(_a, []);
    return (<div className="invoice-details-table">
            <table className="body-wrap">
                <tbody>
                <tr>

                    <td className="container" width="600">
                        <div className="content">
                            <table className="main-receipt" width="100%" cellPadding="0" cellSpacing="0">
                                <tbody>
                                <tr>
                                    <td className="content-wrap aligncenter">
                                        <table width="100%" cellPadding="0" cellSpacing="0">
                                            <tbody>
                                            <tr>
                                                <td className="content-block">
                                                    <h2>Invoice #{props.data.invoice.id}</h2>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td className="content-block">
                                                    <table className="invoice">
                                                        <tbody>
                                                        <tr>
                                                            <td>{`${props.data.user.first_name} ${props.data.user.last_name}`}<br />{(0, dayjs_1.default)(props.data.invoice.billed).format("YYYY-MM-DD").toString()}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table className="invoice-items" cellPadding="0" cellSpacing="0">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td>Fee</td>
                                                                        <td className="alignright">10:-</td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td>Trip</td>
                                                                        <td className="alignright">{`${props.data.invoice.amount - 10}:-`}</td>
                                                                    </tr>
                                                                    <tr className="total">
                                                                        <td className="alignright" width="80%">Total
                                                                        </td>
                                                                        <td className="alignright">{`${props.data.invoice.amount}:-`}</td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td className="content-block">
                                                    Snålåk. Blekinge tekniska högskola, Karlskrona
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div className="footer">
                                <table width="100%">
                                    <tbody>
                                    <tr>
                                        <td className="aligncenter content-block">Questions? Email <a href="mailto:">support@snalak.se</a></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </td>
                    <td></td>
                </tr>
                </tbody>
            </table>

        </div>);
};
exports.InvoiceDetailsTable = InvoiceDetailsTable;
