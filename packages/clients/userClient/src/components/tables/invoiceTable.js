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
function InvoiceTable(_a) {
    var props = __rest(_a, []);
    if (props.invoices) {
        return (<table className="invoiceTable">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Resans id</th>
                        <th>Betald</th>
                        <th>Summa</th>
                        <th>Fakturerad</th>
                    
                    </tr>
                </thead>
                <tbody>
                {props.invoices.map((invoice) => {
                return (<tr key={invoice.id} className="invoiceTable-row">
                               <td>{invoice.id}</td>
                               <td>{invoice.trip_id}</td>
                               <td>{invoice.payed}</td>
                               <td>{invoice.amount}</td>
                               <td>{invoice.billed}</td>
                            </tr>);
            })}
                </tbody>
            </table>);
    }
    return (<div>
            <p>Loading...</p>
        </div>);
}
exports.default = InvoiceTable;
