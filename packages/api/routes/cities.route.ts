import express from 'express';
import {cities} from '../services/cities';

const router = express.Router();

router.get('/', async (req: any, res: any)  => {

    try {
        const result = await cities.getCities();

        res.status(200).send(result);
    } catch (err) {

        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

export const citiesRouter = router;
