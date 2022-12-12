import {ChargingZoneInterface} from '../interfaces/chargingzoneInterface';
import {connect} from "../db/dbConnection";

export const chargingZones = {
    /**
     *


     */
    getChargingZones: async () => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL show_charging_zone_all()`;

        const res = await db.query(sql);
        const chargingZones = res.length === 2 ? res[0] : [];

        await db.end();


        return chargingZones;
    },

    /**
     *

     * @param options.area required
     * @param options.id requiredThe unique identifier of a charging zone
     * @param options.parking_zone_id required

     */
    postChargingZones: async (options: ChargingZoneInterface) => {

        const chargingZoneDetails = [
            options.parking_zone_id,
            options.area
        ]
        const db = await connect();

        await db.getConnection();

        const sql = `CALL charging_zone_add(?, ?)`;

        const res = await db.query(sql, [... chargingZoneDetails]);

        const newChargingZone = res[0];

        await db.end();

        return newChargingZone;
    },

    /**
     *
     * @param cityName Name of the city where the charging zones are located

     */
    getCityCityName: async (cityName: string) => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL show_charging_zone_city()`;
        const res = await db.query(sql, cityName);
        const chargingZones = res.length === 2 ? res[0] : [];

        await db.end();


        return chargingZones;
    },

    /**
     *
     * @param chargingZoneId The unique identifier of the charging zone

     */
    getChargingZoneId: async (chargingZoneId: number) => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL show_charging_zone_id(?)`;

        const res = await db.query(sql, chargingZoneId);
        const chargingZone = res.length === 2 ? res[0] : [];
        await db.end();

        return chargingZone;
    },

    /**
     *
     * @param options.chargingZoneId The unique identifier of the charging zone
     * @param options.parking_zone_id requiredThe unique identifier of a charging zone
     * @param options.area required

     */
    putChargingZoneId: async (options: ChargingZoneInterface) => {

        const chargingZoneDetails = [
            options.id,
            options.parking_zone_id,
            options.area
        ]
        const db = await connect();

        await db.getConnection();

        const sql = `CALL update_charging_zone(?, ?, ?)`;

        const res = await db.query(sql, [... chargingZoneDetails]);

        const updatedChargingZone = res[0];
        await db.end();

        return updatedChargingZone;
    },

    /**
     *
     * @param chargingZoneId The unique identifier of the charging zone

     */
    deleteChargingZoneId: async (chargingZoneId: number) => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL delete_charging_zone(?)`;

        const res = await db.query(sql, chargingZoneId);

        await db.end();

        return res;
    },
};
