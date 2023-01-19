import {ScooterInterface} from '../interfaces/scooterInterface';
import {fetchConn} from "../db/dbConnection";


function getScooterParams (options: ScooterInterface) {
    return [
        options.id,
        options.available,
        options.enabled,
        options.charge,
        options.last_serviced,
        "2012-10-05 13:55:00",
        options.distance_traveled,
        options.last_position,
        options.is_charging,
        options.city_id
    ];
}

export const scooters = {

    /**
     *

     */
    getScooters: async () => {
        const conn = await fetchConn();
        const sql = `CALL show_scooter_all()`;
        const res = await conn.query(sql);
        const scooters = res.length === 2 ? res[0] : [];
        await conn.release();

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
        const scooterDetails = getScooterParams(options);
        const conn = await fetchConn();
        const sql = `CALL add_user(?, ?, ?, ?, ?, ?)`;
        const res = await conn.query(sql, [... scooterDetails]);
        const newScooter = res[0];
        await conn.end();

        return newScooter;
    },

    /**
     *


     */
    getAvailable: async () => {
        const conn = await fetchConn();
        const sql = `CALL show_scooter_available()`;
        const res = await conn.query(sql);
        const availableScooters = res.length === 2 ? res[0] : [];
        await conn.end();

        return availableScooters;
    },

    /**
     *
     * @param cityName Name of the city where the scooters are located

     */
    getCityCityName: async (cityName: string) => {
        const conn = await fetchConn();
        const sql = `CALL show_scooter_city(?)`;
        const res = await conn.query(sql, cityName);
        const scooters = res.length === 2 ? res[0] : [];
        await conn.end();

        return scooters;
    },

    /**
     *
     * @param scooterId The unique identifier of the scooter

     */
    getScooterId: async (scooterId: number) => {
        const conn = await fetchConn();
        const sql = `CALL show_scooter_id(?)`;
        const res = await conn.query(sql, scooterId);
        const scooter = res.length === 2 ? res[0] : [];
        await conn.end();

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
        const scooterDetails = getScooterParams(options);
        const conn = await fetchConn();
        const sql = `CALL update_scooter(?, ?, ?, ?, ?, ?, ? ,?, ?, ?)`;
        const res = await conn.query(sql, [... scooterDetails]);
        const updatedScooter = res[0];
        await conn.release();

        return updatedScooter;
    },

    /**
     *
     * @param scooterId The unique identifier of the scooter

     */
    deleteScooterId: async (scooterId: number) => {
        const conn = await fetchConn();
        const sql = `CALL delete_scooter(?)`;
        const res = await conn.query(sql, scooterId);
        await conn.end();

        return res;
    },

    /**
     *
     * @param scooterId The unique identifier of the scooter

     */
    getScooterIdLogs: async (scooterId: number) => {
        const conn = await fetchConn();
        const sql = `CALL show_scooter_logs(?)`;
        const res = await conn.query(sql, scooterId);
        const scooterLogs = res.length === 2 ? res[0] : [];
        await conn.end();

        return scooterLogs;
    },

    /**
     *
     * @param id The unique identifier of the scooter


     */
    enableScooter: async (id: number) => {
        const conn = await fetchConn();
        const sql = `CALL enable_scooter(?)`;
        const res = await conn.query(sql, [id]);
        const updatedScooter = res[0];
        await conn.release();

        return updatedScooter;
    },

    /**
     *
     * @param id The unique identifier of the scooter


     */
    disableScooter: async (id: number) => {
        const conn = await fetchConn();
        const sql = `CALL disable_scooter(?)`;
        const res = await conn.query(sql, [id]);
        const updatedScooter = res[0];
        await conn.release();

        return updatedScooter;
    },
};
