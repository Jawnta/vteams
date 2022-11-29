import {ParkingZoneInterface} from "../interfaces/parkingzoneInterface";

export const parkingZones = {
    /**
     *


     */
    getParkingZones: async () => {

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
                "area": "<Geometry>",
                "city_id": "<CityId>",
                "id": "<ParkingZoneId>",
            }],
            status: number = 200;

        return {
            status: status,
            data: data
        };
    },

    /**
     *

     * @param options.parkingZone.area required
     * @param options.parkingZone.city_id requiredThe unique identifier of a city
     * @param options.parkingZone.id requiredThe unique identifier of a parking zone

     */
    postParkingZones: async (options: ParkingZoneInterface[]) => {

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
     * @param cityName Name of the city where the parking zones are located

     */
    getCityCityName: async (cityName: string) => {

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
                "area": "<Geometry>",
                "city_id": "<CityId>",
                "id": "<ParkingZoneId>",
            }],
            status: number = 200;

        return {
            status: status,
            data: data
        };
    },

    /**
     *
     * @param parkingZoneId The unique identifier of the parking zone

     */
    getParkingZoneId: async (parkingZoneId: number) => {

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
                "area": "<Geometry>",
                "city_id": "<CityId>",
                "id": "<ParkingZoneId>",
            },
            status: number = 200;

        return {
            status: status,
            data: data
        };
    },

    /**
     *
     * @param options.parkingZoneId The unique identifier of the parking zone
     * @param options.parkingZone.area required
     * @param options.parkingZone.city_id requiredThe unique identifier of a city
     * @param options.parkingZone.id requiredThe unique identifier of a parking zone

     */
    putParkingZoneId: async (options: { parkingZoneId: number; parkingZone: ParkingZoneInterface[]}) => {

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
     * @param parkingZoneId The unique identifier of the parking zone

     */
    deleteParkingZoneId: async (parkingZoneId: number) => {

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
