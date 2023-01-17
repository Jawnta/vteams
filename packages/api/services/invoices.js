"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.invoices = void 0;
const dbConnection_1 = require("../db/dbConnection");
exports.invoices = {
    /**
     *


     */
    getInvoices: () => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL show_invoice_all()`;
        const res = yield conn.query(sql);
        const invoices = res.length === 2 ? res[0] : [];
        yield conn.release();
        return invoices;
    }),
    /**
     *

     * @param options.amount required
     * @param options.id requiredThe unique identifier of an invoice
     * @param options.status required
     * @param options.trip_id requiredThe unique identifier of a trip

     */
    postInvoices: (options) => __awaiter(void 0, void 0, void 0, function* () {
        const invoiceDetails = [
            options.trip_id,
            options.status,
            options.amount
        ];
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL invoice_add(?, ?, ?)`;
        const res = yield conn.query(sql, [...invoiceDetails]);
        const newInvoice = res[0];
        yield conn.release();
        return newInvoice;
    }),
    /**
     *
     * @param invoiceId The unique identifier of the invoice

     */
    getInvoiceId: (invoiceId) => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL show_invoice_id(?)`;
        const res = yield conn.query(sql, invoiceId);
        const invoice = res.length === 2 ? res[0] : [];
        yield conn.release();
        return invoice;
    }),
    /**
     *
     * @param options.id The unique identifier of the invoice
     * @param options.amount required
     * @param options.id requiredThe unique identifier of an invoice
     * @param options.status required
     * @param options.trip_id requiredThe unique identifier of a trip

     */
    putInvoiceId: (options) => __awaiter(void 0, void 0, void 0, function* () {
        const invoiceDetails = [
            options.id,
            options.trip_id,
            options.status,
            options.amount
        ];
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL update_user(?, ?, ?, ?)`;
        const res = yield conn.query(sql, [...invoiceDetails]);
        const updatedInvoice = res[0];
        yield conn.release();
        return updatedInvoice;
    }),
    /**
     *
     * @param invoiceId The unique identifier of the invoice

     */
    deleteInvoiceId: (invoiceId) => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL delete_invoice(?)`;
        const res = yield conn.query(sql, invoiceId);
        yield conn.release();
        return res;
    }),
};
