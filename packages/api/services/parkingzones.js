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
exports.parkingZones = void 0;
exports.parkingZones = {
    /**
     *


     */
    getParkingZones: () =>
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
                        city_id: '<CityId>',
                        id: '<ParkingZoneId>',
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

     * @param options.parkingZone.area required
     * @param options.parkingZone.city_id requiredThe unique identifier of a city
     * @param options.parkingZone.id requiredThe unique identifier of a parking zone

     */
    postParkingZones: (options) =>
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
     * @param cityName Name of the city where the parking zones are located

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
                        area: '<Geometry>',
                        city_id: '<CityId>',
                        id: '<ParkingZoneId>',
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
     * @param parkingZoneId The unique identifier of the parking zone

     */
    getParkingZoneId: (parkingZoneId) =>
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
                    city_id: '<CityId>',
                    id: '<ParkingZoneId>',
                },
                status = 200;
            return {
                status: status,
                data: data,
            };
        }),
    /**
     *
     * @param options.parkingZoneId The unique identifier of the parking zone
     * @param options.parkingZone.area required
     * @param options.parkingZone.city_id requiredThe unique identifier of a city
     * @param options.parkingZone.id requiredThe unique identifier of a parking zone

     */
    putParkingZoneId: (options) =>
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
     * @param parkingZoneId The unique identifier of the parking zone

     */
    deleteParkingZoneId: (parkingZoneId) =>
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
