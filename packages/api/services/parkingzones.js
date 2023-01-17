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
exports.parkingZones = void 0;
const dbConnection_1 = require("../db/dbConnection");
exports.parkingZones = {
    /**
     *


     */
    getParkingZones: () => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL show_parking_zone_all()`;
        const res = yield conn.query(sql);
        const parkingZones = res.length === 2 ? res[0] : [];
        yield conn.release();
        return parkingZones;
    }),
    /**
     *

     * @param options.parkingZone.area required
     * @param options.parkingZone.city_id requiredThe unique identifier of a city
     * @param options.parkingZone.id requiredThe unique identifier of a parking zone

     */
    postParkingZones: (options) => __awaiter(void 0, void 0, void 0, function* () {
        const parkingZoneDetails = [
            options.city_id,
            options.area
        ];
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL parking_zone_add(?, ?)`;
        const res = yield conn.query(sql, [...parkingZoneDetails]);
        const newParkingZone = res[0];
        yield conn.release();
        return newParkingZone;
    }),
    /**
     *
     * @param cityName Name of the city where the parking zones are located

     */
    getCityCityName: (cityName) => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL show_parking_zone_city(?)`;
        const res = yield conn.query(sql, [cityName]);
        const parkingZones = res.length === 2 ? res[0] : [];
        yield conn.release();
        return parkingZones;
    }),
    /**
     *
     * @param parkingZoneId The unique identifier of the parking zone

     */
    getParkingZoneId: (parkingZoneId) => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL show_parking_zone_id(?)`;
        const res = yield conn.query(sql, parkingZoneId);
        const parkingZone = res.length === 2 ? res[0] : [];
        yield conn.release();
        return parkingZone;
    }),
    /**
     *
     * @param options.parkingZone.area required
     * @param options.city_id requiredThe unique identifier of a city
     * @param options.id required The unique identifier of a parking zone

     */
    putParkingZoneId: (options) => __awaiter(void 0, void 0, void 0, function* () {
        const parkingZoneDetails = [
            options.id,
            options.city_id,
            options.area
        ];
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL update_parking_zone(?, ?, ?)`;
        const res = yield conn.query(sql, [...parkingZoneDetails]);
        const updatedParkingZone = res[0];
        yield conn.release();
        return updatedParkingZone;
    }),
    /**
     *
     * @param parkingZoneId The unique identifier of the parking zone

     */
    deleteParkingZoneId: (parkingZoneId) => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL delete_parking_zone(?)`;
        const res = yield conn.query(sql, parkingZoneId);
        yield conn.release();
        return res;
    }),
};
