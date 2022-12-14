import React from 'react';

import "../css/InvoiceDetails.css";
import {InvoiceDetailsTable} from "./InvoiceDetailsTable";
import {useLocation, useNavigate} from 'react-router-dom';



export const InvoiceDetails = () => {
    const location = useLocation();
    const navigate = useNavigate();

    const navigateBackToInvoices = () => {
        navigate(`/users/${location.state.user.id}/invoices`);
    };

    return (
        <div className="invoice-details-wrapper">
        <div className="invoice-details">
            <h1>Invoice details</h1>
            <h2 onClick={() => {navigateBackToInvoices();}}>«</h2>
            <InvoiceDetailsTable
                data={location.state}
            />

        </div>
        </div>
    );
}
