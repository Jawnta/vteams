import {ParkingZoneInterface} from '../interfaces/parkingzoneInterface';
import {connect} from "../db/dbConnection";

export const parkingZones = {
    /**
     *


     */
    getParkingZones: async () => {
        const db = await connect();

        await db.getConnection();

        const sql = `CALL show_parking_zone_all()`;

        const res = await db.query(sql);

        const parkingZones = res.length === 2 ? res[0] : [];

        await db.end();
  

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
        const db = await connect();

        await db.getConnection();

        const sql = `CALL parking_zone_add(?, ?)`;

        const res = await db.query(sql, [... parkingZoneDetails]);

        const newParkingZone = res[0];

        await db.end();

        return newParkingZone;
    },

    /**
     *
     * @param cityName Name of the city where the parking zones are located

     */
    getCityCityName: async (cityName: string) => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL show_parking_zone_city(?)`;

        const res = await db.query(sql, [cityName]);
        const parkingZones = res.length === 2 ? res[0] : [];
        await db.end();

        return parkingZones;
    },

    /**
     *
     * @param parkingZoneId The unique identifier of the parking zone

     */
    getParkingZoneId: async (parkingZoneId: number) => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL show_parking_zone_id(?)`;

        const res = await db.query(sql, parkingZoneId);
        const parkingZone = res.length === 2 ? res[0] : [];
        await db.end();

        return parkingZone;
    },

    /**
     *
     * @param options.parkingZoneId The unique identifier of the parking zone
     * @param options.parkingZone.area required
     * @param options.parkingZone.city_id requiredThe unique identifier of a city
     * @param options.parkingZone.id requiredThe unique identifier of a parking zone

     */
    putParkingZoneId: async (options: {
        parkingZoneId: number;
        parkingZone: ParkingZoneInterface;
    }) => {

        const parkingZoneDetails = [
            options.parkingZoneId,
            options.parkingZone.city_id,
            options.parkingZone.area
        ]
        const db = await connect();

        await db.getConnection();

        const sql = `CALL update_parking_zone(?, ?, ?)`;

        const res = await db.query(sql, [... parkingZoneDetails]);

        const updatedParkingZone = res[0];
        await db.end();

        return updatedParkingZone;
    },

    /**
     *
     * @param parkingZoneId The unique identifier of the parking zone

     */
    deleteParkingZoneId: async (parkingZoneId: number) => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL delete_parking_zone(?)`;

        const res = await db.query(sql, parkingZoneId);

        await db.end();

        return res;
    },
};


