import {ParkingZoneInterface} from '../interfaces/parkingzoneInterface';
import {fetchConn} from "../db/dbConnection";

export const parkingZones = {
    /**
     *


     */
    getParkingZones: async () => {
        const conn = await fetchConn();
        const sql = `CALL show_parking_zone_all()`;
        const res = await conn.query(sql);
        const parkingZones = res.length === 2 ? res[0] : [];
        await conn.release();

        return parkingZones;

    },

    /**
     *

     * @param options.parkingZone.area required
     * @param options.parkingZone.city_id requiredThe unique identifier of a city
     * @param options.parkingZone.id requiredThe unique identifier of a parking zone

     */
    postParkingZones: async (options: ParkingZoneInterface) => {
        const parkingZoneDetails = [
            options.city_id,
            options.area
        ]
        const conn = await fetchConn();
        const sql = `CALL parking_zone_add(?, ?)`;
        const res = await conn.query(sql, [... parkingZoneDetails]);
        const newParkingZone = res[0];
        await conn.release();

        return newParkingZone;
    },

    /**
     *
     * @param cityName Name of the city where the parking zones are located

     */
    getCityCityName: async (cityName: string) => {
        const conn = await fetchConn();
        const sql = `CALL show_parking_zone_city(?)`;
        const res = await conn.query(sql, [cityName]);
        const parkingZones = res.length === 2 ? res[0] : [];
        await conn.release();

        return parkingZones;
    },

    /**
     *
     * @param parkingZoneId The unique identifier of the parking zone

     */
    getParkingZoneId: async (parkingZoneId: number) => {
        const conn = await fetchConn();
        const sql = `CALL show_parking_zone_id(?)`;
        const res = await conn.query(sql, parkingZoneId);
        const parkingZone = res.length === 2 ? res[0] : [];
        await conn.release();

        return parkingZone;
    },

    /**
     *
     * @param options.parkingZone.area required
     * @param options.city_id requiredThe unique identifier of a city
     * @param options.id required The unique identifier of a parking zone

     */
    putParkingZoneId: async (options: ParkingZoneInterface) => {
        const parkingZoneDetails = [
            options.id,
            options.city_id,
            options.area
        ]
        const conn = await fetchConn();
        const sql = `CALL update_parking_zone(?, ?, ?)`;
        const res = await conn.query(sql, [... parkingZoneDetails]);
        const updatedParkingZone = res[0];
        await conn.release();

        return updatedParkingZone;
    },

    /**
     *
     * @param parkingZoneId The unique identifier of the parking zone

     */
    deleteParkingZoneId: async (parkingZoneId: number) => {
        const conn = await fetchConn();
        const sql = `CALL delete_parking_zone(?)`;
        const res = await conn.query(sql, parkingZoneId);
        await conn.release();

        return res;
    },
};


