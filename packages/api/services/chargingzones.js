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
exports.chargingZones = void 0;
const dbConnection_1 = require("../db/dbConnection");
exports.chargingZones = {
    /**
     *


     */
    getChargingZones: () => __awaiter(void 0, void 0, void 0, function* () {
        const db = yield (0, dbConnection_1.connect)();
        yield db.getConnection();
        const sql = `CALL show_charging_zone_all()`;
        const res = yield db.query(sql);
        const chargingZones = res.length === 2 ? res[0] : [];
        yield db.end();
        return chargingZones;
    }),
    /**
     *

     * @param options.area required
     * @param options.id requiredThe unique identifier of a charging zone
     * @param options.parking_zone_id required

     */
    postChargingZones: (options) => __awaiter(void 0, void 0, void 0, function* () {
        const chargingZoneDetails = [
            options.parking_zone_id,
            options.area
        ];
        const db = yield (0, dbConnection_1.connect)();
        yield db.getConnection();
        const sql = `CALL charging_zone_add(?, ?)`;
        const res = yield db.query(sql, [...chargingZoneDetails]);
        const newChargingZone = res[0];
        yield db.end();
        return newChargingZone;
    }),
    /**
     *
     * @param cityName Name of the city where the charging zones are located

     */
    getCityCityName: (cityName) => __awaiter(void 0, void 0, void 0, function* () {
        const db = yield (0, dbConnection_1.connect)();
        yield db.getConnection();
        const sql = `CALL show_charging_zone_city()`;
        const res = yield db.query(sql, cityName);
        const chargingZones = res.length === 2 ? res[0] : [];
        yield db.end();
        return chargingZones;
    }),
    /**
     *
     * @param chargingZoneId The unique identifier of the charging zone

     */
    getChargingZoneId: (chargingZoneId) => __awaiter(void 0, void 0, void 0, function* () {
        const db = yield (0, dbConnection_1.connect)();
        yield db.getConnection();
        const sql = `CALL show_charging_zone_id(?)`;
        const res = yield db.query(sql, chargingZoneId);
        const chargingZone = res.length === 2 ? res[0] : [];
        yield db.end();
        return chargingZone;
    }),
    /**
     *
     * @param options.chargingZoneId The unique identifier of the charging zone
     * @param options.parking_zone_id requiredThe unique identifier of a charging zone
     * @param options.area required

     */
    putChargingZoneId: (options) => __awaiter(void 0, void 0, void 0, function* () {
        const chargingZoneDetails = [
            options.id,
            options.parking_zone_id,
            options.area
        ];
        const db = yield (0, dbConnection_1.connect)();
        yield db.getConnection();
        const sql = `CALL update_charging_zone(?, ?, ?)`;
        const res = yield db.query(sql, [...chargingZoneDetails]);
        const updatedChargingZone = res[0];
        yield db.end();
        return updatedChargingZone;
    }),
    /**
     *
     * @param chargingZoneId The unique identifier of the charging zone

     */
    deleteChargingZoneId: (chargingZoneId) => __awaiter(void 0, void 0, void 0, function* () {
        const db = yield (0, dbConnection_1.connect)();
        yield db.getConnection();
        const sql = `CALL delete_charging_zone(?)`;
        const res = yield db.query(sql, chargingZoneId);
        yield db.end();
        return res;
    }),
};
