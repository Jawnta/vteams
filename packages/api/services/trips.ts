import {TripInterface} from '../interfaces/tripsInterface';
import {fetchConn} from "../db/dbConnection";
export const trips = {
    /**
     *


     */
    getTrips: async () => {
        const conn = await fetchConn();
        const sql = `CALL show_trip_all()`;
        const res = await conn.query(sql);
        const trips = res.length === 2 ? res[0] : [];
        await conn.release();

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
        const conn = await fetchConn();
        const sql = `CALL add_user(?, ?, ?)`;
        const res = await conn.query(sql, [... tripDetails]);
        const newTrip = res[0];
        await conn.release();

        return newTrip;
    },

    /**
     *
     * @param tripId The unique identifier of the trip

     */
    getTripId: async (tripId: number) => {
        const conn = await fetchConn();
        const sql = `CALL show_trip_id(?)`;
        const res = await conn.query(sql, tripId);
        const trip = res.length === 2 ? res[0] : [];
        await conn.release();

        return trip;
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
    putTripId: async (options: TripInterface) => {
        const tripDetails = [
            options.id,
            options.user_id,
            options.scooter_id,
            options.distance,
            options.completed,
            options.start_position,
            options.stop_position,
            options.start_time,
            options.stop_time
        ]
        const conn = await fetchConn();
        const sql = `CALL update_trip(?, ?, ?, ?, ?, ?, ? ,?, ?)`;
        const res = await conn.query(sql, [... tripDetails]);
        const updatedTrip = res[0];
        await conn.release();

        return updatedTrip;
    },

    /**
     *
     * @param tripId The unique identifier of the trip

     */
    deleteTripId: async (tripId: number) => {
        const conn = await fetchConn();
        const sql = `CALL delete_trip(?)`;
        const res = await conn.query(sql, tripId);
        await conn.release();

        return res;
    },
};
