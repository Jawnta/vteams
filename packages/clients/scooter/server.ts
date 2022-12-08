import express from 'express';
const PORT = process.env.PORT || 1337;
const app = express();
app.set('port', PORT);

import Pool from "./pool";
const pool = new Pool();
pool.getScootersFromDb().then(r => 'what');

const router = express.Router();

router.get('/', async (req, res) => {
    try {
        const result = pool.getScooters();
        res.status(200).json(result);
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

app.listen(PORT, () => {
    console.log(
        `Express Server started on Port ${app.get(
            'port'
        )} | Environment : ${app.get('env')}`
    );
});

