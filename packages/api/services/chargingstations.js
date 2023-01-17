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
exports.chargingStations = void 0;
const dbConnection_1 = require("../db/dbConnection");
exports.chargingStations = {
    /**
     *


     */
    getChargingStations: () => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL show_charging_station_all()`;
        const res = yield conn.query(sql);
        const chargingStations = res.length === 2 ? res[0] : [];
        yield conn.release();
        return chargingStations;
    }),
    /**
     *

     * @param options.charging_zone_id requiredThe unique identifier of a charging zone
     * @param options.id requiredThe unique identifier of a charging station
     * @param options.occupied required
     * @param options.position required

     */
    postChargingStations: (options) => __awaiter(void 0, void 0, void 0, function* () {
        const chargingStationDetails = [
            options.charging_zone_id,
            options.position,
            0
        ];
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL charging_station_add(?, ?, ?)`;
        const res = yield conn.query(sql, [...chargingStationDetails]);
        const newChargingStation = res[0];
        yield conn.release();
        return newChargingStation;
    }),
    /**
     *
     * @param chargingZoneId The unique identifier of the charging zone

     */
    getZoneChargingZoneId: (chargingZoneId) => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL show_charging_station_zone(?)`;
        const res = yield conn.query(sql, chargingZoneId);
        const chargingStations = res.length === 2 ? res[0] : [];
        yield conn.release();
        return chargingStations;
    }),
    /**
     *
     * @param chargingStationId The unique identifier of the charging station

     */
    getChargingStationId: (chargingStationId) => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL show_charging_station_id(?)`;
        const res = yield conn.query(sql, chargingStationId);
        const chargingStation = res.length === 2 ? res[0] : [];
        yield conn.release();
        return chargingStation;
    }),
    /**
     *
     * @param options.id The unique identifier of the charging station
     * @param options.chargingStation.charging_zone_id requiredThe unique identifier of a charging zone
     * @param options.charging_zone_id requiredThe unique identifier of a charging station
     * @param options.occupied required
     * @param options.position required

     */
    putChargingStationId: (options) => __awaiter(void 0, void 0, void 0, function* () {
        const chargingStationDetails = [
            options.id,
            options.charging_zone_id,
            options.position,
            0
        ];
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL update_charging_station(?, ?, ?, ?)`;
        const res = yield conn.query(sql, [...chargingStationDetails]);
        const updatedChargingStation = res[0];
        yield conn.release();
        return updatedChargingStation;
    }),
    /**
     *
     * @param chargingStationId The unique identifier of the charging station

     */
    deleteChargingStationId: (chargingStationId) => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL delete_charging_station(?)`;
        const res = yield conn.query(sql, chargingStationId);
        yield conn.release();
        return res;
    }),
};
