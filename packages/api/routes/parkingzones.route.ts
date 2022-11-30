import express from 'express';
import {parkingZones} from '../services/parkingzones';
import {ParkingZoneInterface} from '../interfaces/parkingzoneInterface';

const router = express.Router();

router.get('/', async (req, res) => {
    try {
        const result = await parkingZones.getParkingZones();
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.post('/', async (req, res) => {
    const data: ParkingZoneInterface[] = req.body;

    try {
        const result = await parkingZones.postParkingZones(data);
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
        const result = await parkingZones.getCityCityName(cityName);
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.get('/:parkingZoneId', async (req, res) => {
    const parkingZoneId: number = +req.params.parkingZoneId;

    try {
        const result = await parkingZones.getParkingZoneId(parkingZoneId);
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.put('/:parkingZoneId', async (req, res) => {
    const parkingZone: ParkingZoneInterface[] = req.body;
    const data = {
        parkingZoneId: +req.params.parkingZoneId,
        parkingZone: parkingZone,
    };

    try {
        const result = await parkingZones.putParkingZoneId(data);
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.delete('/:parkingZoneId', async (req, res) => {
    const parkingZoneId = +req.params.parkingZoneId;

    try {
        const result = await parkingZones.deleteParkingZoneId(parkingZoneId);
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

export const parkingZonesRouter = router;
