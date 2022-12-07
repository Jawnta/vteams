import express from 'express';
import {login} from '../services/login';

const router = express.Router();

router.post('/', async (req: any, res: any)  => {

    try {
        const result = await login.getToken();
        res.send(result);
    } catch (err) {

        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

export const loginRouter = router;
