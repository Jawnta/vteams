import {UserInterface} from '../interfaces/userInterface';
import {fetchConn} from "../db/dbConnection";
import { addFundsInterface } from '../interfaces/addFundsInterface';

export const users = {
    /**
     *


     */
    getUsers: async () => {
        const conn = await fetchConn();
        const sql = `CALL show_user_all()`;
        const res = await conn.query(sql);
        const users = res.length === 2 ? res[0] : [];
        await conn.release();

        return users;
    },

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
    postUsers: async (options: UserInterface) => {

        const userDetails = [
            options.first_name,
            options.last_name || null,
            options.phone_number || null,
            options.email,
            options.social_security || null,
            options.token || null
        ]
        const conn = await fetchConn();
        const sql = `CALL user_add(?, ?, ?, ?, ?, ?)`;
        const res = await conn.query(sql, [... userDetails]);
        const newUser = res[0];
        await conn.release();

        return newUser;
    },
    /**
     *
     * @param options.funds credit balance
     * @param options.user_id requiredThe unique identifier of a user
     */
    postFunds: async (options: addFundsInterface) => {

        const userDetails = [
            options.user_id,
            options.funds,
        ]
        const conn = await fetchConn();
        const sql = `CALL add_credit(?, ?)`;
        const res = await conn.query(sql, [... userDetails]);
        const newFunds = res[0];
        await conn.release();

        return newFunds;
    },

    /**
     *
     * @param userId The unique identifier of the user

     */
    getUserId: async (userId: number) => {
        const conn = await fetchConn();
        const sql = `CALL show_user_id(?)`;
        const res = await conn.query(sql, userId);
        const user = res.length === 2 ? res[0] : [];
        await conn.release();

        return user;

    },
    /**
     *
     * @param userToken The unique identifier of the user

     */
    getUserToken: async (userToken: string) => {
        const conn = await fetchConn();

        const sql = `CALL show_user_token(?)`;

        const res = await conn.query(sql, userToken);
        const user = res.length === 2 ? res[0] : [];
        await conn.release();

        return user;

    },

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
    putUserId: async (options: UserInterface) => {
        const userDetails = [
            options.id,
            options.first_name,
            options.last_name || null,
            options.phone_number || null,
            options.email || null,
            options.social_security || null,
            options.enabled || null,
            options.credit || null,
            options.token || null
        ]
        const conn = await fetchConn();
        const sql = `CALL update_user(?, ?, ?, ?, ?, ?, ?, ?, ?)`;
        const res = await conn.query(sql, [... userDetails]);
        const updatedUser = res[0];
        await conn.release();

        return updatedUser;
    },

    /**
     *
     * @param userId The unique identifier of the user

     */
    deleteUserId: async (userId: number) => {
        const conn = await fetchConn();
        const sql = `CALL delete_user(?)`;
        const res = await conn.query(sql, userId);
        await conn.release();

        return res;
    },

    /**
     *
     * @param userId The unique identifier of the user

     */
    getUserIdInvoices: async (userId: number) => {
        const conn = await fetchConn();
        const sql = `CALL show_invoice_user(?)`;
        const res = await conn.query(sql, userId);
        const invoices = res.length === 2 ? res[0] : [];
        await conn.release();

        return invoices;
    },

    /**
     *
     * @param userId The unique identifier of the user

     */
    getUserIdTrips: async (userId: number) => {
        const conn = await fetchConn();
        const sql = `CALL show_trip_user(?)`;
        const res = await conn.query(sql, userId);
        const trips = res.length === 2 ? res[0] : [];
        await conn.release();

        return trips;
    },
};
