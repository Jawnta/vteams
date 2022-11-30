import express from 'express';
import {chargingStations} from '../services/chargingstations';
import {ChargingStationInterface} from '../interfaces/chargingstationInterface';

const router = express.Router();

router.get('/', async (req, res) => {
    try {
        const result = await chargingStations.getChargingStations();
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.post('/', async (req, res) => {
    const data: ChargingStationInterface[] = req.body;

    try {
        const result = await chargingStations.postChargingStations(data);
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.get('/zone/:chargingZoneId', async (req, res) => {
    const chargingZoneId: number = +req.params.chargingZoneId;

    try {
        const result = await chargingStations.getZoneChargingZoneId(
            chargingZoneId
        );
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.get('/:chargingStationId', async (req, res) => {
    const chargingStationId: number = +req.params.chargingStationId;

    try {
        const result = await chargingStations.getChargingStationId(
            chargingStationId
        );
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.put('/:chargingStationId', async (req, res) => {
    const chargingStation: ChargingStationInterface[] = req.body;
    const data = {
        chargingStationId: +req.params.chargingStationId,
        chargingStation: chargingStation,
    };

    try {
        const result = await chargingStations.putChargingStationId(data);
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.delete('/:chargingStationId', async (req, res) => {
    const chargingStationId: number = +req.params.chargingStationId;

    try {
        const result = await chargingStations.deleteChargingStationId(
            chargingStationId
        );
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

module.exports = router;
