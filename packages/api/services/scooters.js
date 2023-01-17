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
exports.scooters = void 0;
const dbConnection_1 = require("../db/dbConnection");
function getScooterParams(options) {
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
exports.scooters = {
    /**
     *

     */
    getScooters: () => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL show_scooter_all()`;
        const res = yield conn.query(sql);
        const scooters = res.length === 2 ? res[0] : [];
        yield conn.release();
        return scooters;
    }),
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
    postScooters: (options) => __awaiter(void 0, void 0, void 0, function* () {
        const scooterDetails = getScooterParams(options);
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL add_user(?, ?, ?, ?, ?, ?)`;
        const res = yield conn.query(sql, [...scooterDetails]);
        const newScooter = res[0];
        yield conn.end();
        return newScooter;
    }),
    /**
     *


     */
    getAvailable: () => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL show_scooter_available()`;
        const res = yield conn.query(sql);
        const availableScooters = res.length === 2 ? res[0] : [];
        yield conn.end();
        return availableScooters;
    }),
    /**
     *
     * @param cityName Name of the city where the scooters are located

     */
    getCityCityName: (cityName) => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL show_scooter_city(?)`;
        const res = yield conn.query(sql, cityName);
        const scooters = res.length === 2 ? res[0] : [];
        yield conn.end();
        return scooters;
    }),
    /**
     *
     * @param scooterId The unique identifier of the scooter

     */
    getScooterId: (scooterId) => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL show_scooter_id(?)`;
        const res = yield conn.query(sql, scooterId);
        const scooter = res.length === 2 ? res[0] : [];
        yield conn.end();
        return scooter;
    }),
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
    putScooterId: (options) => __awaiter(void 0, void 0, void 0, function* () {
        const scooterDetails = getScooterParams(options);
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL update_scooter(?, ?, ?, ?, ?, ?, ? ,?, ?, ?)`;
        const res = yield conn.query(sql, [...scooterDetails]);
        const updatedScooter = res[0];
        yield conn.release();
        return updatedScooter;
    }),
    /**
     *
     * @param scooterId The unique identifier of the scooter

     */
    deleteScooterId: (scooterId) => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL delete_scooter(?)`;
        const res = yield conn.query(sql, scooterId);
        yield conn.end();
        return res;
    }),
    /**
     *
     * @param scooterId The unique identifier of the scooter

     */
    getScooterIdLogs: (scooterId) => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL show_scooter_logs(?)`;
        const res = yield conn.query(sql, scooterId);
        const scooterLogs = res.length === 2 ? res[0] : [];
        yield conn.end();
        return scooterLogs;
    }),
};
