import * as chargingStations from './routes/chargingstations.route';
import * as chargingZones from './routes/chargingzones.route';
import * as cities from './routes/cities.route';
import * as invoices from './routes/invoices.route';
import * as parkingZones from './routes/parkingzones.route';
import * as scooters from './routes/scooters.route';
import * as trips from './routes/trips.route';
import * as users from './routes/users.route';

module.exports = function (app: {use: (arg0: string, arg1: any) => void}) {
    /*
     * Routes
     */
    app.use('/chargingstations', chargingStations);
    app.use('/chargingzones', chargingZones);
    app.use('/cities', cities);
    app.use('/invoices', invoices);
    app.use('/parkingzones', parkingZones);
    app.use('/scooters', scooters);
    app.use('/trips', trips);
    app.use('/users', users);
};
