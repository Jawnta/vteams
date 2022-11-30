import express from 'express';
import {scooters} from '../services/scooters';
import {ScooterInterface} from '../interfaces/scooterInterface';

const router = express.Router();

router.get('/', async (req, res) => {
    try {
        const result = await scooters.getScooters();
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.post('/', async (req, res) => {
    const data: ScooterInterface[] = req.body;

    try {
        const result = await scooters.postScooters(data);
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.get('/available', async (req, res) => {
    try {
        const result = await scooters.getAvailable();
        res.status(result.status || 200).send(result.data);
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
        res.status(result.status || 200).send(result.data);
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
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.put('/:scooterId', async (req, res) => {
    const scooter: ScooterInterface[] = req.body;
    const data = {
        scooterId: +req.params.scooterId,
        scooter: scooter,
    };

    try {
        const result = await scooters.putScooterId(data);
        res.status(result.status || 200).send(result.data);
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
        res.status(result.status || 200).send(result.data);
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
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

module.exports = router;
