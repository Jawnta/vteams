import express from 'express';
import {chargingZones} from '../services/chargingzones';
import {ChargingZoneInterface} from '../interfaces/chargingzoneInterface';

const router = express.Router();

router.get('/', async (req, res) => {
    try {
        const result = await chargingZones.getChargingZones();
        res.status(200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.post('/', async (req, res) => {
    const data: ChargingZoneInterface = req.body;
    if (!data.parking_zone_id || !data.area) {
        res.sendStatus(400);
    }

    try {
        const result = await chargingZones.postChargingZones(data);
        res.status(200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.get('/city/:cityName', async (req, res) => {
    const cityName: string = req.params.cityName;

    try {
        const result = await chargingZones.getCityCityName(cityName);
        res.status(200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.get('/:chargingZoneId', async (req, res) => {
    const chargingZoneId: number = +req.params.chargingZoneId;

    try {
        const result = await chargingZones.getChargingZoneId(chargingZoneId);
        res.status(200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.put('/:chargingZoneId', async (req, res) => {
    const chargingZone: ChargingZoneInterface = req.body;
    const data = {
        chargingZoneId: +req.params.chargingZoneId,
        chargingZone: chargingZone,
    };

    if (!chargingZone.parking_zone_id || !chargingZone.area) {
        res.sendStatus(400);
    }
    try {
        const result = await chargingZones.putChargingZoneId(data);
        res.status(200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.delete('/:chargingZoneId', async (req, res) => {
    const chargingZoneId: number = +req.params.chargingZoneId;

    try {
        const result = await chargingZones.deleteChargingZoneId(chargingZoneId);
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

export const chargingZoneRouter = router;
