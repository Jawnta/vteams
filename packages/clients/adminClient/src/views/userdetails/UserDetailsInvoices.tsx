import React, {useEffect, useState} from 'react';
import "../css/UserDetailInvoices.css";
import {useOutletContext, useParams} from "react-router-dom";
import {UserDetailsInvoicesTable} from "./UserDetailsInvoicesTable";



export const UserDetailsInvoices = () => {

    const [invoices, setInvoices] = useState([]);
    const params = useParams();
    // @ts-ignore
    const [user] = useOutletContext();


    useEffect(() => {
        const getInvoices = async (id: string | undefined) => {
            const response = await fetch(`/users/${id}/invoices`);
            return await response.json();
        }
        getInvoices(params.userId).then(r => setInvoices(r));
    },[params.userId])

    return (
        <div className="user-details-invoices">

            <h1>Invoices</h1>
            <UserDetailsInvoicesTable
                invoices={invoices}
                user={user}
            />


        </div>
    );
}
