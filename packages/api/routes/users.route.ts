import express from 'express';
import {users} from '../services/users';
const router = express.Router();
import {UserInterface} from '../interfaces/userInterface';
import { addFundsInterface } from '../interfaces/addFundsInterface';

router.get('/', async (req, res) => {
    try {
        const result = await users.getUsers();
        res.status(200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.post('/', async (req, res) => {
    const userData: UserInterface = req.body;
    if (!userData.first_name || !userData.last_name) {
        return res.sendStatus(400);
    }

    try {
        const result = await users.postUsers(userData);
        res.status(200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.post('/:userId/funds', async (req, res) => {
    const userData: addFundsInterface = req.body;
    if (!userData.user_id || !userData.funds) {
        return res.sendStatus(400);
    }

    try {
        const result = await users.postFunds(userData);
        res.status(200).json(result);
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
        res.status(200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.put('/:userId', async (req, res) => {
    const user = req.body;

    if (!user.first_name || !user.last_name) {
        res.sendStatus(400);
    }

    try {
        const result = await users.putUserId(user);
        res.status(200).json(result);
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

router.get('/:userId/invoices', async (req, res) => {
    const userId: number = +req.params.userId;

    try {
        const result = await users.getUserIdInvoices(userId);
        res.status(200).json(result);
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
        res.status(200).send(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});
router.get('/token/:token', async (req, res) => {
    const userToken: string = req.params.token;

    try {
        const result = await users.getUserToken(userToken);
        res.status(200).send(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

export const userRouter = router;
