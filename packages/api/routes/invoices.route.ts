import express from 'express';
import {invoices} from '../services/invoices';
import {InvoiceInterface} from '../interfaces/invoiceInterface';
const router = express.Router();

router.get('/', async (req, res) => {
    try {
        const result = await invoices.getInvoices();
        res.status(200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.post('/', async (req, res) => {
    const data: InvoiceInterface = req.body;
    if (!data.trip_id || !data.status || !data.amount) {
        res.sendStatus(400);
    }

    try {
        const result = await invoices.postInvoices(data);
        res.status(200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.get('/:invoiceId', async (req, res) => {
    const invoiceId: number = +req.params.invoiceId;

    try {
        const result = await invoices.getInvoiceId(invoiceId);
        res.status(200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.put('/:invoiceId', async (req, res) => {
    const invoice: InvoiceInterface = req.body;
    const data = {
        invoiceId: +req.params.invoiceId,
        invoice: invoice,
    };

    if (!invoice.trip_id || !invoice.status || !invoice.amount) {
        res.sendStatus(400);
    }

    try {
        const result = await invoices.putInvoiceId(data);
        res.status(200).send(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.delete('/:invoiceId', async (req, res) => {
    const invoiceId: number = +req.params.invoiceId;

    try {
        const result = await invoices.deleteInvoiceId(invoiceId);
        if (!result.affectedRows) {
            res.sendStatus(400);
        }
        res.sendStatus(200);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

export const invoicesRouter = router;
