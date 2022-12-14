import express from 'express';
import Pool from "./pool";
import cookieParser from "cookie-parser";

const PORT = process.env.PORT || 1337;
const app = express();
app.set('port', PORT);
// parse application/json
app.use(express.json());
// parse raw text
app.use(express.text());
// parse application/x-www-form-urlencoded
app.use(express.urlencoded({extended: true}));
app.use(cookieParser());
app.use(function(req, res, next) {
    res.setHeader('Connection', 'close');
    next();
});

const pool = new Pool();
pool.getScootersFromDb().then(r => pool.populate(r));

app.get('/', async (req, res) => {
    try {
        const scooters = pool.getScooters();
        return res.status(200).json(scooters).send();
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

app.get('/:scooterId', async(req, res) => {
    try {
        const scooterId = +req.params.scooterId;
        if (!pool.scooterExists(scooterId)) {
            return res.status(404).send({
                error: 'Scooter not found'
            });
        }
        const scooter = pool.getScooter(scooterId);
        return res.status(200).json(scooter).send();
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
})

app.put('/:scooterId', async (req, res) => {
    try {
        const scooterId = +req.params.scooterId;
        if (!pool.scooterExists(scooterId)) {
            return res.status(404).send({
                error: 'Scooter not found'
            });
        }
        const scooter = pool.setScooter(scooterId, req.body);
        return res.status(204).json(scooter).send;
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
})

app.listen(PORT, () => {
    console.log(
        `Express Server started on Port ${app.get(
            'port'
        )} | Environment : ${app.get('env')}`
    );
});


