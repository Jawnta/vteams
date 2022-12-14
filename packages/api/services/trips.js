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
exports.trips = void 0;
const dbConnection_1 = require("../db/dbConnection");
exports.trips = {
    /**
     *


     */
    getTrips: () => __awaiter(void 0, void 0, void 0, function* () {
        const db = yield (0, dbConnection_1.connect)();
        yield db.getConnection();
        const sql = `CALL show_trip_all()`;
        const res = yield db.query(sql);
        const trips = res.length === 2 ? res[0] : [];
        yield db.end();
        return trips;
    }),
    /**
     *

     * @param options.completed required
     * @param options.distance required
     * @param options.id requiredThe unique identifier of a trip
     * @param options.scooter_id required
     * @param options.start_position required
     * @param options.start_time required
     * @param options.stop_position required
     * @param options.stop_time required
     * @param options.user_id requiredThe unique identifier of a user

     */
    postTrips: (options) => __awaiter(void 0, void 0, void 0, function* () {
        const tripDetails = [
            options.user_id,
            options.scooter_id,
            options.start_position
        ];
        const db = yield (0, dbConnection_1.connect)();
        yield db.getConnection();
        const sql = `CALL add_user(?, ?, ?)`;
        const res = yield db.query(sql, [...tripDetails]);
        const newTrip = res[0];
        yield db.end();
        return newTrip;
    }),
    /**
     *
     * @param tripId The unique identifier of the trip

     */
    getTripId: (tripId) => __awaiter(void 0, void 0, void 0, function* () {
        const db = yield (0, dbConnection_1.connect)();
        yield db.getConnection();
        const sql = `CALL show_trip_id(?)`;
        const res = yield db.query(sql, tripId);
        const trip = res.length === 2 ? res[0] : [];
        yield db.end();
        return trip;
    }),
    /**
     *
     * @param options.completed required
     * @param options.distance required
     * @param options.id requiredThe unique identifier of a trip
     * @param options.scooter_id required
     * @param options.start_position required
     * @param options.start_time required
     * @param options.stop_position required
     * @param options.stop_time required
     * @param options.user_id requiredThe unique identifier of a user

     */
    putTripId: (options) => __awaiter(void 0, void 0, void 0, function* () {
        const tripDetails = [
            options.id,
            options.user_id,
            options.scooter_id,
            options.distance,
            options.completed,
            options.start_position,
            options.stop_position,
            options.start_time,
            options.stop_time
        ];
        const db = yield (0, dbConnection_1.connect)();
        yield db.getConnection();
        const sql = `CALL update_trip(?, ?, ?, ?, ?, ?, ? ,?, ?)`;
        const res = yield db.query(sql, [...tripDetails]);
        const updatedTrip = res[0];
        yield db.end();
        return updatedTrip;
    }),
    /**
     *
     * @param tripId The unique identifier of the trip

     */
    deleteTripId: (tripId) => __awaiter(void 0, void 0, void 0, function* () {
        const db = yield (0, dbConnection_1.connect)();
        yield db.getConnection();
        const sql = `CALL delete_trip(?)`;
        const res = yield db.query(sql, tripId);
        yield db.end();
        return res;
    }),
};
