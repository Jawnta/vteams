"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.routes = void 0;
const chargingstations_route_1 = require("./routes/chargingstations.route");
const chargingzones_route_1 = require("./routes/chargingzones.route");
const cities_route_1 = require("./routes/cities.route");
const invoices_route_1 = require("./routes/invoices.route");
const parkingzones_route_1 = require("./routes/parkingzones.route");
const scooters_route_1 = require("./routes/scooters.route");
const trips_route_1 = require("./routes/trips.route");
const users_route_1 = require("./routes/users.route");
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
const routes = function (app) {
    /*
    * Routes
    */
    app.use('/chargingstations', chargingstations_route_1.chargingStationRouter);
    app.use('/chargingzones', chargingzones_route_1.chargingZoneRouter);
    app.use('/cities', cities_route_1.citiesRouter);
    app.use('/invoices', invoices_route_1.invoicesRouter);
    app.use('/parkingzones', parkingzones_route_1.parkingZonesRouter);
    app.use('/scooters', scooters_route_1.scooterRouter);
    app.use('/trips', trips_route_1.tripsRouter);
    app.use('/users', users_route_1.userRouter);
};
exports.routes = routes;
