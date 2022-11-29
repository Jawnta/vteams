"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.chargingStations = void 0;
exports.chargingStations = {
    /**
     *


     */
    getChargingStations: () => __awaiter(void 0, void 0, void 0, function* () {
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
        const data = [{
                "charging_zone_id": "<ChargingZoneId>",
                "id": "<ChargingStationId>",
                "occupied": "<boolean>",
                "position": "<Coordinates>",
            }], status = 200;
        return {
            status: status,
            data: data
        };
    }),
    /**
     *

     * @param options.charging_zone_id requiredThe unique identifier of a charging zone
     * @param options.id requiredThe unique identifier of a charging station
     * @param options.occupied required
     * @param options.position required

     */
    postChargingStations: (options) => __awaiter(void 0, void 0, void 0, function* () {
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
        const data = {}, status = 201;
        return {
            status: status,
            data: data
        };
    }),
    /**
     *
     * @param chargingZoneId The unique identifier of the charging zone

     */
    getZoneChargingZoneId: (chargingZoneId) => __awaiter(void 0, void 0, void 0, function* () {
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
        const data = [{
                "charging_zone_id": "<ChargingZoneId>",
                "id": "<ChargingStationId>",
                "occupied": "<boolean>",
                "position": "<Coordinates>",
            }], status = 200;
        return {
            status: status,
            data: data
        };
    }),
    /**
     *
     * @param chargingStationId The unique identifier of the charging station

     */
    getChargingStationId: (chargingStationId) => __awaiter(void 0, void 0, void 0, function* () {
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
            "charging_zone_id": "<ChargingZoneId>",
            "id": "<ChargingStationId>",
            "occupied": "<boolean>",
            "position": "<Coordinates>",
        }, status = 200;
        return {
            status: status,
            data: data
        };
    }),
    /**
     *
     * @param options.chargingStationId The unique identifier of the charging station
     * @param options.chargingStation.charging_zone_id requiredThe unique identifier of a charging zone
     * @param options.chargingStation.id requiredThe unique identifier of a charging station
     * @param options.chargingStation.occupied required
     * @param options.chargingStation.position required

     */
    putChargingStationId: (options) => __awaiter(void 0, void 0, void 0, function* () {
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
        const data = {}, status = 200;
        return {
            status: status,
            data: data
        };
    }),
    /**
     *
     * @param chargingStationId The unique identifier of the charging station

     */
    deleteChargingStationId: (chargingStationId) => __awaiter(void 0, void 0, void 0, function* () {
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
        const data = {}, status = 204;
        return {
            status: status,
            data: data
        };
    }),
};
