import { TripInterface } from "../interfaces/tripsInterface";
export const trips = {
    /**
     *


     */
    getTrips: async () => {

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

        const data: TripInterface[] = [],
            status: number = 200;

        return {
            status: status,
            data: data
        };
    },

    /**
     *

     * @param options.trip.completed required
     * @param options.trip.distance required
     * @param options.trip.id requiredThe unique identifier of a trip
     * @param options.trip.scooter_id required
     * @param options.trip.start_position required
     * @param options.trip.start_time required
     * @param options.trip.stop_position required
     * @param options.trip.stop_time required
     * @param options.trip.user_id requiredThe unique identifier of a user

     */
    postTrips: async (options: {}) => {

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
     * @param tripId The unique identifier of the trip

     */
    getTripId: async (tripId: number) => {

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
                "completed": "<boolean>",
                "distance": "<number>",
                "id": "<TripId>",
                "scooter_id": "<integer>",
                "start_position": "<Coordinates>",
                "start_time": "<string>",
                "stop_position": "<Coordinates>",
                "stop_time": "<string>",
                "user_id": "<UserId>",
            },
            status: number = 200;

        return {
            status: status,
            data: data
        };
    },

    /**
     *
     * @param options.tripId The unique identifier of the trip
     * @param options.trip.completed required
     * @param options.trip.distance required
     * @param options.trip.id requiredThe unique identifier of a trip
     * @param options.trip.scooter_id required
     * @param options.trip.start_position required
     * @param options.trip.start_time required
     * @param options.trip.stop_position required
     * @param options.trip.stop_time required
     * @param options.trip.user_id requiredThe unique identifier of a user

     */
    putTripId: async (options: { tripId: number; trip: TripInterface[] }) => {

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
     * @param tripId The unique identifier of the trip

     */
    deleteTripId: async (tripId: number) => {

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
