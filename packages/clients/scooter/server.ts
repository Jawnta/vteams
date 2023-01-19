import express, {Request, Response, NextFunction} from 'express';
import Pool from "./pool";

const PORT = process.env.PORT || 1337;
const app = express();
app.set('port', PORT);
// parse application/json
app.use(express.json());
// parse raw text
app.use(express.text());
// parse application/x-www-form-urlencoded
app.use(express.urlencoded({extended: true}));
app.use(function(req: Request, res: Response, next: NextFunction) {
    res.setHeader('Connection', 'close');
    next();
});

const pool = new Pool();
pool.getScootersFromDb().then(r => pool.populate(r));

app.get('/', async (req: Request, res: Response) => {
    try {
        const scooters = pool.getScooters();
        return res.status(200).json(scooters).send();
    } catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

app.get('/:scooterId', async(req: Request, res: Response) => {
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

app.put('/:scooterId', async (req: Request, res: Response) => {
    try {
        const scooterId = +req.params.scooterId;
        if (!pool.scooterExists(scooterId)) {
            return res.status(404).send({
                error: 'Scooter not found'
            });
        }
        const scooter = pool.setScooter(scooterId, req.body);
        const requestOptions = {
            method: 'PUT',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(req.body)
        };
        const snalResponse = await fetch(`http://localhost:3000/scooters/${scooterId}`, requestOptions);
        if (!snalResponse.ok) {
            return res.status(500).send({
                error: snalResponse.statusText || 'Something went wrong.',
            });
        }
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


