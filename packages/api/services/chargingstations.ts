import {ChargingStationInterface} from '../interfaces/chargingstationInterface';
import {connect} from "../db/dbConnection";

export const chargingStations = {
    /**
     *


     */
    getChargingStations: async () => {
        const db = await connect();
        await db.getConnection();

        const sql = `CALL show_charging_station_all()`;

        const res = await db.query(sql);
        const chargingStations = res.length === 2 ? res[0] : [];

        await db.end();

        return chargingStations;
    },

    /**
     *

     * @param options.charging_zone_id requiredThe unique identifier of a charging zone
     * @param options.id requiredThe unique identifier of a charging station
     * @param options.occupied required
     * @param options.position required

     */
    postChargingStations: async (options: ChargingStationInterface) => {
        const chargingStationDetails = [
            options.charging_zone_id,
            options.position,
            0
        ]
        const db = await connect();

        await db.getConnection();

        const sql = `CALL charging_station_add(?, ?, ?)`;

        const res = await db.query(sql, [... chargingStationDetails]);

        const newChargingStation = res[0];

        await db.end();

        return newChargingStation;
    },

    /**
     *
     * @param chargingZoneId The unique identifier of the charging zone

     */
    getZoneChargingZoneId: async (chargingZoneId: number) => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL show_charging_station_zone(?)`;

        const res = await db.query(sql, chargingZoneId);
        const chargingStations = res.length === 2 ? res[0] : [];
        await db.end();

        return chargingStations;
    },

    /**
     *
     * @param chargingStationId The unique identifier of the charging station

     */
    getChargingStationId: async (chargingStationId: number) => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL show_charging_station_id(?)`;

        const res = await db.query(sql, chargingStationId);
        const chargingStation = res.length === 2 ? res[0] : [];
        await db.end();

        return chargingStation;
    },

    /**
     *
     * @param options.chargingStationId The unique identifier of the charging station
     * @param options.chargingStation.charging_zone_id requiredThe unique identifier of a charging zone
     * @param options.chargingStation.id requiredThe unique identifier of a charging station
     * @param options.chargingStation.occupied required
     * @param options.chargingStation.position required

     */
    putChargingStationId: async (options: {
        chargingStationId: number;
        chargingStation: ChargingStationInterface;
    }) => {
        const chargingStationDetails = [
            options.chargingStationId,
            options.chargingStation.charging_zone_id,
            options.chargingStation.position,
            0
        ]
        const db = await connect();

        await db.getConnection();

        const sql = `CALL update_charging_station(?, ?, ?, ?)`;

        const res = await db.query(sql, [... chargingStationDetails]);

        const updatedChargingStation = res[0];
        await db.end();

        return updatedChargingStation;
    },

    /**
     *
     * @param chargingStationId The unique identifier of the charging station

     */
    deleteChargingStationId: async (chargingStationId: number) => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL delete_charging_station(?)`;

        const res = await db.query(sql, chargingStationId);

        await db.end();

        return res;
    },
};
