import express from 'express';
import { invoices } from '../services/invoices';
const router = express.Router();
import { UserInterface } from "../interfaces/userInterface";

router.get('/', async (req, res, next) => {
    let options = {
    };


    try {
        const result = await invoices.getInvoices(options);
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.'
        });
    }
});

router.post('/', async (req, res, next) => {
    let options = {
    };

    options.invoice = req.body;

    try {
        const result = await invoices.postInvoices(options);
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.'
        });
    }
});

router.get('/:invoiceId', async (req, res, next) => {
    let options = {
        "invoiceId": req.params.invoiceId,
    };


    try {
        const result = await invoices.getInvoiceId(options);
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.'
        });
    }
});

router.put('/:invoiceId', async (req, res, next) => {
    let options = {
        "invoiceId": req.params.invoiceId,
    };

    options.invoice = req.body;

    try {
        const result = await invoices.putInvoiceId(options);
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.'
        });
    }
});

router.delete('/:invoiceId', async (req, res, next) => {
    let options = {
        "invoiceId": req.params.invoiceId,
    };


    try {
        const result = await invoices.deleteInvoiceId(options);
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.'
        });
    }
});

module.exports = router;