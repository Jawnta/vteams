import {UserInterface} from '../interfaces/userInterface';
import {connect} from "../db/dbConnection";

export const users = {
    /**
     *


     */
    getUsers: async () => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL show_user_all()`;

        const res = await db.query(sql);
        const users = res.length === 2 ? res[0] : [];

        await db.end();


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
            options.last_name,
            options.phone_number || null,
            options.email,
            options.social_security || null,
            options.token || null
        ]
        const db = await connect();

        await db.getConnection();

        const sql = `CALL add_user(?, ?, ?, ?, ?, ?)`;

        const res = await db.query(sql, [... userDetails]);

        const newUser = res[0];

        await db.end();

        return newUser;
    },

    /**
     *
     * @param userId The unique identifier of the user

     */
    getUserId: async (userId: number) => {
        const db = await connect();

        await db.getConnection();

        const sql = `CALL show_user_id(?)`;

        const res = await db.query(sql, userId);
        const user = res.length === 2 ? res[0] : [];
        await db.end();

        return user;

    },

    /**
     *
     * @param options.userId The unique identifier of the user
     * @param options.user.creditCurrent credit balance
     * @param options.user.email required
     * @param options.user.enabled requiredReturns false if user is disabled
     * @param options.user.first_name required
     * @param options.user.id requiredThe unique identifier of a user
     * @param options.user.last_name required
     * @param options.user.phone_number required
     * @param options.user.register_date required
     * @param options.user.social_security requiredSocial security number such as Swedish personnummer
     * @param options.user.tokenLogin token for authentication

     */
    putUserId: async (options: {userId: number; user: UserInterface}) => {
        const userDetails = [
            options.userId,
            options.user.first_name,
            options.user.last_name,
            options.user.phone_number || null,
            options.user.email || null,
            options.user.register_date || null,
            options.user.social_security || null,
            options.user.enabled || null,
            options.user.credit || null,
            options.user.token || null
        ]
        const db = await connect();

        await db.getConnection();

        const sql = `CALL update_user(?, ?, ?, ?, ?, ?, ? ,?, ?, ?)`;

        const res = await db.query(sql, [... userDetails]);

        const updatedUser = res[0];
        await db.end();

        return updatedUser;
    },

    /**
     *
     * @param userId The unique identifier of the user

     */
    deleteUserId: async (userId: number) => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL delete_user(?)`;

        const res = await db.query(sql, userId);

        await db.end();

        return res;
    },

    /**
     *
     * @param userId The unique identifier of the user

     */
    getUserIdInvoices: async (userId: number) => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL show_invoice_user(?)`;

        const res = await db.query(sql, userId);

        await db.end();

        return res;
    },

    /**
     *
     * @param userId The unique identifier of the user

     */
    getUserIdTrips: async (userId: number) => {

        const db = await connect();

        await db.getConnection();

        const sql = `CALL show_trip_user(?)`;

        const res = await db.query(sql, userId);

        await db.end();

        return res;
    },
};
