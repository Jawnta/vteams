import express from 'express';
import {scooters} from '../services/scooters';
import {ScooterInterface} from '../interfaces/scooterInterface';

const router = express.Router();

router.get('/', async (req, res) => {
    try {
        const result = await scooters.getScooters();
        res.status(200).send(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.post('/', async (req, res) => {
    const data: ScooterInterface = req.body;

    if (!data.city_id) {
        return res.sendStatus(400);
    }

    try {
        const result = await scooters.postScooters(data);
        res.status(200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.get('/available', async (req, res) => {
    try {
        const result = await scooters.getAvailable();
        res.status( 200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.get('/city/:cityName', async (req, res) => {
    const cityName: string = req.params.cityName;

    try {
        const result = await scooters.getCityCityName(cityName);
        res.status(200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.get('/:scooterId', async (req, res) => {
    const scooterId: number = +req.params.scooterId;
    try {
        const result = await scooters.getScooterId(scooterId);
        res.status(200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.put('/:scooterId', async (req, res) => {
    const scooter: ScooterInterface = req.body;
    const data = {
        scooterId: +req.params.scooterId,
        scooter: scooter,
    };

    if (!scooter.charge) {
        return res.sendStatus(400);
    }

    try {
        const result = await scooters.putScooterId(data);
        res.status(200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.delete('/:scooterId', async (req, res) => {
    const scooterId: number = +req.params.scooterId;

    try {
        const result = await scooters.deleteScooterId(scooterId);
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

router.get('/:scooterId/logs', async (req, res) => {
    const scooterId: number = +req.params.scooterId;

    try {
        const result = await scooters.getScooterIdLogs(scooterId);
        res.status(200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

export const scooterRouter = router;
