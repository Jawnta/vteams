import express from 'express';
import {trips} from '../services/trips';
const router = express.Router();
import {TripInterface} from '../interfaces/tripsInterface';

router.get('/', async (req, res) => {
    try {
        const result = await trips.getTrips();
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.post('/', async (req, res) => {
    const tripData: TripInterface[] = req.body;

    try {
        const result = await trips.postTrips(tripData);
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.get('/:tripId', async (req, res) => {
    const tripId: number = +req.params.tripId;

    try {
        const result = await trips.getTripId(tripId);
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.put('/:tripId', async (req, res) => {
    const trip: TripInterface[] = req.body;
    const data = {
        tripId: +req.params.tripId,
        trip: trip,
    };

    try {
        const result = await trips.putTripId(data);
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.delete('/:tripId', async (req, res) => {
    const tripId: number = +req.params.tripId;

    try {
        const result = await trips.deleteTripId(tripId);
        res.status(result.status || 200).send(result.data);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

export const tripsRouter = router;
