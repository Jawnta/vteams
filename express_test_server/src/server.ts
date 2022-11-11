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
        this.app.get("/", (request: Request, response: Response) => {
            response.send("Hello world");
        });

    };
}
