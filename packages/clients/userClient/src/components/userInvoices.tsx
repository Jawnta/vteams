import React, {useState, useEffect} from 'react';
import InvoiceTable from './tables/invoiceTable';
function UserInvoices({...props}) {
    
    const [invoice, setInvoice] = useState([]);
    useEffect(() => {
        const userId = props.userData.id
        const getInvoices = async () => {
            const response = await fetch(`/users/${userId}/invoices`);
            setInvoice(await response.json());
        };
        getInvoices()
    }, []);

    return(
        <div>
            <h1>Fakturor</h1>
            <InvoiceTable invoices={invoice}/>
        </div>
    )
}

export default UserInvoices;