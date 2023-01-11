import {InvoiceInterface} from '../interfaces/invoiceInterface';
import {fetchConn} from "../db/dbConnection";

export const invoices = {
    /**
     *


     */
    getInvoices: async () => {
        const conn = await fetchConn();
        const sql = `CALL show_invoice_all()`;
        const res = await conn.query(sql);
        const invoices = res.length === 2 ? res[0] : [];
        await conn.release();

        return invoices;
    },

    /**
     *

     * @param options.amount required
     * @param options.id requiredThe unique identifier of an invoice
     * @param options.status required
     * @param options.trip_id requiredThe unique identifier of a trip

     */
    postInvoices: async (options: InvoiceInterface) => {
        const invoiceDetails = [
            options.trip_id,
            options.status,
            options.amount
        ]
        const conn = await fetchConn();
        const sql = `CALL invoice_add(?, ?, ?)`;
        const res = await conn.query(sql, [... invoiceDetails]);
        const newInvoice = res[0];
        await conn.release();

        return newInvoice;
    },

    /**
     *
     * @param invoiceId The unique identifier of the invoice

     */
    getInvoiceId: async (invoiceId: number) => {
        const conn = await fetchConn();
        const sql = `CALL show_invoice_id(?)`;
        const res = await conn.query(sql, invoiceId);
        const invoice = res.length === 2 ? res[0] : [];
        await conn.release();

        return invoice;
    },

    /**
     *
     * @param options.id The unique identifier of the invoice
     * @param options.amount required
     * @param options.id requiredThe unique identifier of an invoice
     * @param options.status required
     * @param options.trip_id requiredThe unique identifier of a trip

     */
    putInvoiceId: async (options: InvoiceInterface) => {
        const invoiceDetails = [
            options.id,
            options.trip_id,
            options.status,
            options.amount
        ]
        const conn = await fetchConn();
        const sql = `CALL update_user(?, ?, ?, ?)`;
        const res = await conn.query(sql, [... invoiceDetails]);
        const updatedInvoice = res[0];
        await conn.release();

        return updatedInvoice;
    },

    /**
     *
     * @param invoiceId The unique identifier of the invoice

     */
    deleteInvoiceId: async (invoiceId: number) => {
        const conn = await fetchConn();
        const sql = `CALL delete_invoice(?)`;
        const res = await conn.query(sql, invoiceId);
        await conn.release();

        return res;
    },
};
