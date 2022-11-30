import express from 'express';
import {users} from '../services/users';
const router = express.Router();
import {UserInterface} from '../interfaces/userInterface';

router.get('/', async (req, res) => {
    try {
        const result = await users.getUsers();
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.post('/', async (req, res) => {
    const userData: UserInterface = req.body;

    try {
        const result = await users.postUsers(userData);
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.get('/:userId', async (req, res) => {
    const userId: number = +req.params.userId;

    try {
        const result = await users.getUserId(userId);
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.put('/:userId', async (req, res) => {
    const user: UserInterface[] = req.body;
    const data = {
        userId: +req.params.userId,
        user: user,
    };

    try {
        const result = await users.putUserId(data);
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.delete('/:userId', async (req, res) => {
    const userId: number = +req.params.userId;

    try {
        const result = await users.deleteUserId(userId);
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.get('/:userId/invoices', async (req, res) => {
    const userId: number = +req.params.userId;

    try {
        const result = await users.getUserIdInvoices(userId);
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.get('/:userId/trips', async (req, res) => {
    const userId: number = +req.params.userId;

    try {
        const result = await users.getUserIdTrips(userId);
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

module.exports = router;
