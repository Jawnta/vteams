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
exports.trips = void 0;
exports.trips = {
    /**
     *


     */
    getTrips: () => __awaiter(void 0, void 0, void 0, function* () {
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
        const data = [], status = 200;
        return {
            status: status,
            data: data
        };
    }),
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
    postTrips: (options) => __awaiter(void 0, void 0, void 0, function* () {
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
     * @param tripId The unique identifier of the trip

     */
    getTripId: (tripId) => __awaiter(void 0, void 0, void 0, function* () {
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
        }, status = 200;
        return {
            status: status,
            data: data
        };
    }),
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
    putTripId: (options) => __awaiter(void 0, void 0, void 0, function* () {
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
     * @param tripId The unique identifier of the trip

     */
    deleteTripId: (tripId) => __awaiter(void 0, void 0, void 0, function* () {
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
