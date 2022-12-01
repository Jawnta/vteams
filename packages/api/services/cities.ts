import {CityInterface} from '../interfaces/cityInterface';
import {dbConnection} from "../db/dbConnection";
export const cities = {
    /**
     *


     */
    getCities: async () => {

        const db = await dbConnection();
        await db.getConnection();

        const sql = `CALL show_city_all()`;

        const res = await db.query(sql);
        await db.end();

        const status = 200;
        const test: CityInterface = res[0];

        return {
            status: status,
            data: test
        };
    },
};
