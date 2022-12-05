import {TripInterface} from '../interfaces/tripsInterface';
import {connect} from "../db/dbConnection";
export const trips = {
    /**
     *


     */
    getTrips: async () => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL show_trip_all()`;

        const res = await db.query(sql);
        const trips = res.length === 2 ? res[0] : [];

        await db.end();


        return trips;
    },

    /**
     *

     * @param options.completed required
     * @param options.distance required
     * @param options.id requiredThe unique identifier of a trip
     * @param options.scooter_id required
     * @param options.start_position required
     * @param options.start_time required
     * @param options.stop_position required
     * @param options.stop_time required
     * @param options.user_id requiredThe unique identifier of a user

     */
    postTrips: async (options: TripInterface) => {

        const tripDetails = [
            options.user_id,
            options.scooter_id,
            options.start_position
        ]
        const db = await connect();

        await db.getConnection();

        const sql = `CALL add_user(?, ?, ?)`;

        const res = await db.query(sql, [... tripDetails]);

        const newTrip = res[0];

        await db.end();

        return newTrip;
    },

    /**
     *
     * @param tripId The unique identifier of the trip

     */
    getTripId: async (tripId: number) => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL show_trip_id(?)`;

        const res = await db.query(sql, tripId);
        const trip = res.length === 2 ? res[0] : [];
        await db.end();

        return trip;
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
    putTripId: async (options: {tripId: number; trip: TripInterface}) => {

        const tripDetails = [
            options.tripId,
            options.trip.user_id,
            options.trip.scooter_id,
            options.trip.distance,
            options.trip.completed,
            options.trip.start_position,
            options.trip.stop_position,
            options.trip.start_time,
            options.trip.stop_time
        ]
        const db = await connect();

        await db.getConnection();

        const sql = `CALL update_trip(?, ?, ?, ?, ?, ?, ? ,?, ?)`;

        const res = await db.query(sql, [... tripDetails]);

        const updatedTrip = res[0];
        await db.end();

        return updatedTrip;
    },

    /**
     *
     * @param tripId The unique identifier of the trip

     */
    deleteTripId: async (tripId: number) => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL delete_trip(?)`;

        const res = await db.query(sql, tripId);

        await db.end();

        return res;
    },
};
