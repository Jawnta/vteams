import express from 'express';
import {trips} from '../services/trips';
const router = express.Router();
import {TripInterface} from '../interfaces/tripsInterface';

router.get('/', async (req, res) => {
    try {
        const result = await trips.getTrips();
        res.status(200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.post('/', async (req, res) => {
    const tripData: TripInterface = req.body;

    if (!tripData.user_id || !tripData.scooter_id || !tripData.start_position) {
        return res.sendStatus(400);
    }

    try {
        const result = await trips.postTrips(tripData);
        res.status(200).json(result);
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
        res.status(200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.put('/:tripId', async (req, res) => {
    const trip: TripInterface = req.body;

    if (!trip.id || !trip.user_id || !trip.scooter_id) {
        res.sendStatus(400);
    }

    try {
        const result = await trips.putTripId(trip);
        res.status(200).json(result);
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

export const tripsRouter = router;
