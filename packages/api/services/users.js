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
exports.users = void 0;
const dbConnection_1 = require("../db/dbConnection");
exports.users = {
    /**
     *


     */
    getUsers: () => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL show_user_all()`;
        const res = yield conn.query(sql);
        const users = res.length === 2 ? res[0] : [];
        yield conn.release();
        return users;
    }),
    /**
     *

     * @param options.creditCurrent credit balance
     * @param options.email required
     * @param options.enabled required Returns false if user is disabled
     * @param options.first_name required
     * @param options.id requiredThe unique identifier of a user
     * @param options.last_name required
     * @param options.phone_number required
     * @param options.register_date required
     * @param options.social_security required Social security number such as Swedish personnummer
     * @param options.tokenLogin token for authentication

     */
    postUsers: (options) => __awaiter(void 0, void 0, void 0, function* () {
        const userDetails = [
            options.first_name,
            options.last_name,
            options.phone_number || null,
            options.email,
            options.social_security || null,
            options.token || null
        ];
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL add_user(?, ?, ?, ?, ?, ?)`;
        const res = yield conn.query(sql, [...userDetails]);
        const newUser = res[0];
        yield conn.release();
        return newUser;
    }),
    /**
     *
     * @param userId The unique identifier of the user

     */
    getUserId: (userId) => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL show_user_id(?)`;
        const res = yield conn.query(sql, userId);
        const user = res.length === 2 ? res[0] : [];
        yield conn.release();
        return user;
    }),
    /**
     *
     * @param userToken The unique identifier of the user

     */
    getUserToken: (userToken) => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL show_user_token(?)`;
        const res = yield conn.query(sql, userToken);
        const user = res.length === 2 ? res[0] : [];
        yield conn.release();
        return user;
    }),
    /**
     *
     * @param options.id The unique identifier of the user
     * @param options.creditCurrent credit balance
     * @param options.email required
     * @param options.enabled requiredReturns false if user is disabled
     * @param options.first_name required
     * @param options.id requiredThe unique identifier of a user
     * @param options.last_name required
     * @param options.phone_number required
     * @param options.register_date required
     * @param options.social_security requiredSocial security number such as Swedish personnummer
     * @param options.tokenLogin token for authentication

     */
    putUserId: (options) => __awaiter(void 0, void 0, void 0, function* () {
        const userDetails = [
            options.id,
            options.first_name,
            options.last_name,
            options.phone_number || null,
            options.email || null,
            options.social_security || null,
            options.enabled || null,
            options.credit || null,
            options.token || null
        ];
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL update_user(?, ?, ?, ?, ?, ?, ?, ?, ?)`;
        const res = yield conn.query(sql, [...userDetails]);
        const updatedUser = res[0];
        yield conn.release();
        return updatedUser;
    }),
    /**
     *
     * @param userId The unique identifier of the user

     */
    deleteUserId: (userId) => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL delete_user(?)`;
        const res = yield conn.query(sql, userId);
        yield conn.release();
        return res;
    }),
    /**
     *
     * @param userId The unique identifier of the user

     */
    getUserIdInvoices: (userId) => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL show_invoice_user(?)`;
        const res = yield conn.query(sql, userId);
        const invoices = res.length === 2 ? res[0] : [];
        yield conn.release();
        return invoices;
    }),
    /**
     *
     * @param userId The unique identifier of the user

     */
    getUserIdTrips: (userId) => __awaiter(void 0, void 0, void 0, function* () {
        const conn = yield (0, dbConnection_1.fetchConn)();
        const sql = `CALL show_trip_user(?)`;
        const res = yield conn.query(sql, userId);
        const trips = res.length === 2 ? res[0] : [];
        yield conn.release();
        return trips;
    }),
};
