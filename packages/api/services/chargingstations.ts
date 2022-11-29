import {ChargingStationInterface} from "../interfaces/chargingstationInterface";

export const chargingStations = {
    /**
     *


     */
    getChargingStations: async () => {

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
            }],
            status: number = 200;

        return {
            status: status,
            data: data
        };
    },

    /**
     *

     * @param options.charging_zone_id requiredThe unique identifier of a charging zone
     * @param options.id requiredThe unique identifier of a charging station
     * @param options.occupied required
     * @param options.position required

     */
    postChargingStations: async (options: ChargingStationInterface[]) => {

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
            status: number = 201;

        return {
            status: status,
            data: data
        };
    },

    /**
     *
     * @param chargingZoneId The unique identifier of the charging zone

     */
    getZoneChargingZoneId: async (chargingZoneId: number) => {

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
            }],
            status: number = 200;

        return {
            status: status,
            data: data
        };
    },

    /**
     *
     * @param chargingStationId The unique identifier of the charging station

     */
    getChargingStationId: async (chargingStationId: number) => {

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
            },
            status: number = 200;

        return {
            status: status,
            data: data
        };
    },

    /**
     *
     * @param options.chargingStationId The unique identifier of the charging station
     * @param options.chargingStation.charging_zone_id requiredThe unique identifier of a charging zone
     * @param options.chargingStation.id requiredThe unique identifier of a charging station
     * @param options.chargingStation.occupied required
     * @param options.chargingStation.position required

     */
    putChargingStationId: async (options: { chargingStationId: number; chargingStation: ChargingStationInterface[] }) => {

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
            status: number = 200;

        return {
            status: status,
            data: data
        };
    },

    /**
     *
     * @param chargingStationId The unique identifier of the charging station

     */
    deleteChargingStationId: async (chargingStationId: number) => {

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
            status: number = 204;

        return {
            status: status,
            data: data
        };
    },
};
