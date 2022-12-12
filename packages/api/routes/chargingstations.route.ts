import express from 'express';
import {chargingStations} from '../services/chargingstations';
import {ChargingStationInterface} from '../interfaces/chargingstationInterface';

const router = express.Router();

router.get('/', async (req, res) => {
    try {
        const result = await chargingStations.getChargingStations();
        res.status(200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.post('/', async (req, res) => {
    const data: ChargingStationInterface = req.body;
    if (!data.charging_zone_id || !data.position) {
        res.sendStatus(400);
    }

    try {
        const result = await chargingStations.postChargingStations(data);
        res.status(200).json(result);
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
        res.status(200).json(result);
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
        res.status(200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.put('/:chargingStationId', async (req, res) => {
    const chargingStation: ChargingStationInterface = req.body;


    if (!chargingStation.charging_zone_id || !chargingStation.position || !chargingStation.occupied) {
        res.sendStatus(400);
    }

    try {
        const result = await chargingStations.putChargingStationId(chargingStation);
        res.status(200).json(result);
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

export const chargingStationRouter = router;
