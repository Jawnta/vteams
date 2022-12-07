import { Router } from "express";
import { chargingStationRouter } from './routes/chargingstations.route';
import { chargingZoneRouter }from './routes/chargingzones.route';
import { citiesRouter } from './routes/cities.route';
import { invoicesRouter } from './routes/invoices.route';
import { parkingZonesRouter } from './routes/parkingzones.route';
import { scooterRouter } from './routes/scooters.route';
import { tripsRouter } from './routes/trips.route';
import { userRouter } from './routes/users.route';
import { loginRouter } from "./routes/login.route";
//
// export default function (app: {use: (arg0: string, arg1: any) => void}) {
//     /*
//      * Routes
//      */
//     app.use('/chargingstations', chargingStations);
//     app.use('/chargingzones', chargingZones);
//     app.use('/cities', cities);
//     app.use('/invoices', invoices);
//     app.use('/parkingzones', parkingZones);
//     app.use('/scooters', scooters);
//     app.use('/trips', trips);
//     app.use('/users', users);
// }

export const routes = function (app: {use: (arg0: string, arg1: Router) => void}) {
    /*
    * Routes
    */

    app.use('/chargingstations', chargingStationRouter);
    app.use('/chargingzones', chargingZoneRouter);
    app.use('/cities', citiesRouter);
    app.use('/invoices', invoicesRouter);
    app.use('/parkingzones', parkingZonesRouter);
    app.use('/scooters', scooterRouter);
    app.use('/trips', tripsRouter);
    app.use('/users', userRouter);
    app.use('/login', loginRouter);

};