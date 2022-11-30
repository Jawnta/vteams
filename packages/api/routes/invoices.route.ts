import express from 'express';
import {invoices} from '../services/invoices';
import {InvoiceInterface} from '../interfaces/invoiceInterface';
const router = express.Router();

router.get('/', async (req, res, next) => {
    try {
        const result = await invoices.getInvoices();
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.post('/', async (req, res, next) => {
    const data: InvoiceInterface[] = req.body;

    try {
        const result = await invoices.postInvoices(data);
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.get('/:invoiceId', async (req, res, next) => {
    const invoiceId: number = +req.params.invoiceId;

    try {
        const result = await invoices.getInvoiceId(invoiceId);
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.put('/:invoiceId', async (req, res, next) => {
    const invoice: InvoiceInterface[] = req.body;
    const data = {
        invoiceId: +req.params.invoiceId,
        invoice: invoice,
    };

    try {
        const result = await invoices.putInvoiceId(data);
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.delete('/:invoiceId', async (req, res, next) => {
    const invoiceId: number = +req.params.invoiceId;

    try {
        const result = await invoices.deleteInvoiceId(invoiceId);
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

module.exports = router;
