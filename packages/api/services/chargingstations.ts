import {ChargingStationInterface} from '../interfaces/chargingstationInterface';
import {fetchConn} from "../db/dbConnection";

export const chargingStations = {
    /**
     *


     */
    getChargingStations: async () => {
        const conn = await fetchConn();
        const sql = `CALL show_charging_station_all()`;
        const res = await conn.query(sql);
        const chargingStations = res.length === 2 ? res[0] : [];
        await conn.release();

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
        const conn = await fetchConn();
        const sql = `CALL charging_station_add(?, ?, ?)`;
        const res = await conn.query(sql, [... chargingStationDetails]);
        const newChargingStation = res[0];
        await conn.release();

        return newChargingStation;
    },

    /**
     *
     * @param chargingZoneId The unique identifier of the charging zone

     */
    getZoneChargingZoneId: async (chargingZoneId: number) => {
        const conn = await fetchConn();
        const sql = `CALL show_charging_station_zone(?)`;
        const res = await conn.query(sql, chargingZoneId);
        const chargingStations = res.length === 2 ? res[0] : [];
        await conn.release();

        return chargingStations;
    },

    /**
     *
     * @param chargingStationId The unique identifier of the charging station

     */
    getChargingStationId: async (chargingStationId: number) => {
        const conn = await fetchConn();
        const sql = `CALL show_charging_station_id(?)`;
        const res = await conn.query(sql, chargingStationId);
        const chargingStation = res.length === 2 ? res[0] : [];
        await conn.release();

        return chargingStation;
    },

    /**
     *
     * @param options.id The unique identifier of the charging station
     * @param options.chargingStation.charging_zone_id requiredThe unique identifier of a charging zone
     * @param options.charging_zone_id requiredThe unique identifier of a charging station
     * @param options.occupied required
     * @param options.position required

     */
    putChargingStationId: async (options: ChargingStationInterface) => {
        const chargingStationDetails = [
            options.id,
            options.charging_zone_id,
            options.position,
            0
        ]
        const conn = await fetchConn();
        const sql = `CALL update_charging_station(?, ?, ?, ?)`;
        const res = await conn.query(sql, [... chargingStationDetails]);
        const updatedChargingStation = res[0];
        await conn.release();

        return updatedChargingStation;
    },

    /**
     *
     * @param chargingStationId The unique identifier of the charging station

     */
    deleteChargingStationId: async (chargingStationId: number) => {
        const conn = await fetchConn();
        const sql = `CALL delete_charging_station(?)`;
        const res = await conn.query(sql, chargingStationId);
        await conn.release();

        return res;
    },
};
