import { Router, Application } from "express";
import {routes} from "./routes";

export const versions = (app: Application) => {
    app.use('/v1', routes);
}
