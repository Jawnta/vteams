'use strict';
var __awaiter =
    (this && this.__awaiter) ||
    function (thisArg, _arguments, P, generator) {
        function adopt(value) {
            return value instanceof P
                ? value
                : new P(function (resolve) {
                      resolve(value);
                  });
        }
        return new (P || (P = Promise))(function (resolve, reject) {
            function fulfilled(value) {
                try {
                    step(generator.next(value));
                } catch (e) {
                    reject(e);
                }
            }
            function rejected(value) {
                try {
                    step(generator['throw'](value));
                } catch (e) {
                    reject(e);
                }
            }
            function step(result) {
                result.done
                    ? resolve(result.value)
                    : adopt(result.value).then(fulfilled, rejected);
            }
            step(
                (generator = generator.apply(thisArg, _arguments || [])).next()
            );
        });
    };
Object.defineProperty(exports, '__esModule', {value: true});
exports.chargingZones = void 0;
exports.chargingZones = {
    /**
     *


     */
    getChargingZones: () =>
        __awaiter(void 0, void 0, void 0, function* () {
            // Implement your business logic here...
            //
            // Return all 2xx and 4xx as follows:
            //
            // return {
            //   status: 'statusCode',
            //   data: 'response'
            // }
            // If an error happens during your business logic implementation,
            // you can throw it as follows:
            //
            // throw new Error('<Error message>'); // this will result in a 500
            const data = [
                    {
                        area: '<Geometry>',
                        id: '<ChargingZoneId>',
                        parking_zone_id: '<integer>',
                    },
                ],
                status = 200;
            return {
                status: status,
                data: data,
            };
        }),
    /**
     *

     * @param options.area required
     * @param options.id requiredThe unique identifier of a charging zone
     * @param options.parking_zone_id required

     */
    postChargingZones: (options) =>
        __awaiter(void 0, void 0, void 0, function* () {
            // Implement your business logic here...
            //
            // Return all 2xx and 4xx as follows:
            //
            // return {
            //   status: 'statusCode',
            //   data: 'response'
            // }
            // If an error happens during your business logic implementation,
            // you can throw it as follows:
            //
            // throw new Error('<Error message>'); // this will result in a 500
            const data = {},
                status = 201;
            return {
                status: status,
                data: data,
            };
        }),
    /**
     *
     * @param cityName Name of the city where the charging zones are located

     */
    getCityCityName: (cityName) =>
        __awaiter(void 0, void 0, void 0, function* () {
            // Implement your business logic here...
            //
            // Return all 2xx and 4xx as follows:
            //
            // return {
            //   status: 'statusCode',
            //   data: 'response'
            // }
            // If an error happens during your business logic implementation,
            // you can throw it as follows:
            //
            // throw new Error('<Error message>'); // this will result in a 500
            const data = [
                    {
                        available: '<boolean>',
                        charge: '<number>',
                        city_id: '<CityId>',
                        distance_traveled: '<number>',
                        enabled: '<boolean>',
                        first_used: '<string>',
                        id: '<ScooterId>',
                        is_charging: '<boolean>',
                        last_position: '<Coordinates>',
                        last_serviced: '<string>',
                    },
                ],
                status = 200;
            return {
                status: status,
                data: data,
            };
        }),
    /**
     *
     * @param chargingZoneId The unique identifier of the charging zone

     */
    getChargingZoneId: (chargingZoneId) =>
        __awaiter(void 0, void 0, void 0, function* () {
            // Implement your business logic here...
            //
            // Return all 2xx and 4xx as follows:
            //
            // return {
            //   status: 'statusCode',
            //   data: 'response'
            // }
            // If an error happens during your business logic implementation,
            // you can throw it as follows:
            //
            // throw new Error('<Error message>'); // this will result in a 500
            const data = {
                    area: '<Geometry>',
                    id: '<ChargingZoneId>',
                    parking_zone_id: '<integer>',
                },
                status = 200;
            return {
                status: status,
                data: data,
            };
        }),
    /**
     *
     * @param options.chargingZoneId The unique identifier of the charging zone
     * @param options.chargingZone.area required
     * @param options.chargingZone.id requiredThe unique identifier of a charging zone
     * @param options.chargingZone.parking_zone_id required

     */
    putChargingZoneId: (options) =>
        __awaiter(void 0, void 0, void 0, function* () {
            // Implement your business logic here...
            //
            // Return all 2xx and 4xx as follows:
            //
            // return {
            //   status: 'statusCode',
            //   data: 'response'
            // }
            // If an error happens during your business logic implementation,
            // you can throw it as follows:
            //
            // throw new Error('<Error message>'); // this will result in a 500
            const data = {},
                status = 200;
            return {
                status: status,
                data: data,
            };
        }),
    /**
     *
     * @param chargingZoneId The unique identifier of the charging zone

     */
    deleteChargingZoneId: (chargingZoneId) =>
        __awaiter(void 0, void 0, void 0, function* () {
            // Implement your business logic here...
            //
            // Return all 2xx and 4xx as follows:
            //
            // return {
            //   status: 'statusCode',
            //   data: 'response'
            // }
            // If an error happens during your business logic implementation,
            // you can throw it as follows:
            //
            // throw new Error('<Error message>'); // this will result in a 500
            const data = {},
                status = 204;
            return {
                status: status,
                data: data,
            };
        }),
};
