import {ScooterInterface} from '../interfaces/scooterInterface';
import {connect} from "../db/dbConnection";

export const scooters = {
    /**
     *


     */
    getScooters: async () => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL show_scooter_all()`;

        const res = await db.query(sql);
        const scooters = res.length === 2 ? res[0] : [];

        await db.end();


        return scooters;
    },

    /**
     *

     * @param options.available requiredReturns false if scooter is unavailable
     * @param options.charge required
     * @param options.city_id requiredThe unique identifier of a city
     * @param options.distance_traveled required
     * @param options.enabled required
     * @param options.first_used required
     * @param options.id requiredThe unique identifier of a scooter
     * @param options.is_charging required
     * @param options.last_position required
     * @param options.last_serviced required

     */
    postScooters: async (options: ScooterInterface) => {
        const scooterDetails = [
            options.available,
            options.enabled,
            options.charge,
            options.last_position,
            options.is_charging,
            options.city_id
        ]
        const db = await connect();

        await db.getConnection();

        const sql = `CALL add_user(?, ?, ?, ?, ?, ?)`;

        const res = await db.query(sql, [... scooterDetails]);

        const newScooter = res[0];

        await db.end();

        return newScooter;
    },

    /**
     *


     */
    getAvailable: async () => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL show_scooter_available()`;

        const res = await db.query(sql);
        const availableScooters = res.length === 2 ? res[0] : [];

        await db.end();


        return availableScooters;
    },

    /**
     *
     * @param cityName Name of the city where the scooters are located

     */
    getCityCityName: async (cityName: string) => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL show_scooter_city(?)`;

        const res = await db.query(sql, cityName);
        const scooters = res.length === 2 ? res[0] : [];
        await db.end();

        return scooters;
    },

    /**
     *
     * @param scooterId The unique identifier of the scooter

     */
    getScooterId: async (scooterId: number) => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL show_scooter_id(?)`;

        const res = await db.query(sql, scooterId);
        const scooter = res.length === 2 ? res[0] : [];
        await db.end();

        return scooter;
    },

    /**
     *
     * @param options.id The unique identifier of the scooter
     * @param options.available requiredReturns false if scooter is unavailable
     * @param options.charge required
     * @param options.city_id requiredThe unique identifier of a city
     * @param options.distance_traveled required
     * @param options.enabled required
     * @param options.first_used required
     * @param options.id requiredThe unique identifier of a scooter
     * @param options.is_charging required
     * @param options.last_position required
     * @param options.last_serviced required

     */
    putScooterId: async (options: ScooterInterface) => {

        const scooterDetails = [
            options.id,
            options.available,
            options.enabled,
            options.charge,
            options.last_serviced,
            options.first_used,
            options.distance_traveled,
            options.last_position,
            options.is_charging,
            options.city_id
        ]
        const db = await connect();

        await db.getConnection();

        const sql = `CALL update_scooter(?, ?, ?, ?, ?, ?, ? ,?, ?, ?)`;

        const res = await db.query(sql, [... scooterDetails]);

        const updatedScooter = res[0];
        await db.end();

        return updatedScooter;
    },

    /**
     *
     * @param scooterId The unique identifier of the scooter

     */
    deleteScooterId: async (scooterId: number) => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL delete_scooter(?)`;

        const res = await db.query(sql, scooterId);

        await db.end();

        return res;
    },

    /**
     *
     * @param scooterId The unique identifier of the scooter

     */
    getScooterIdLogs: async (scooterId: number) => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL show_scooter_logs(?)`;

        const res = await db.query(sql, scooterId);
        const scooterLogs = res.length === 2 ? res[0] : [];
        await db.end();

        return scooterLogs;
    },
};
