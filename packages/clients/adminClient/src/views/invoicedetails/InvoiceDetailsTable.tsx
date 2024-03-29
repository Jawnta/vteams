import React from 'react';
import dayjs from 'dayjs';

import "../css/InvoiceDetailsTable.css";



export const InvoiceDetailsTable = ({...props}) => {
    return (
        <div className="invoice-details-table">
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
                                                            <td>{`${props.data.user.first_name} ${props.data.user.last_name}`}<br/>{dayjs(props.data.invoice.billed).format("YYYY-MM-DD").toString()}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table className="invoice-items" cellPadding="0"
                                                                       cellSpacing="0">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td>Fee</td>
                                                                        <td className="alignright">{props.data.invoice.fee}:-</td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td>Trip</td>
                                                                        <td className="alignright">{`${props.data.invoice.amount - props.data.invoice.fee}:-`}</td>
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
                                        <td className="aligncenter content-block">Questions? Email <a
                                            href="mailto:">support@snalak.se</a></td>
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

        </div>
    );
}
