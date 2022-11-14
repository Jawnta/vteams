import express, { Express, Request, Response } from "express";
import bodyParser from "body-parser";

export class Api {
    private app: Express;

    constructor() {}

    startApi = () => {
        this.app = express();
        this.app.use(bodyParser.json());
        this.createRoutes();
        this.app.listen(1337, () => {
            console.log(`Server listening on 1337`);
        });
    };

    createRoutes = () => {

        //Stad_1
        this.app.get("/bikes/:city", (request: Request, response: Response) => {
            return get_bikes(req.body.city);
        });

        //Stad_2
        //routes....

    };
}
