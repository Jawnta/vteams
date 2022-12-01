import { CityInterface } from '../interfaces/cityInterface';
import { connect } from "../db/dbConnection";
export const cities = {
    /**
     *


     */
    getCities: async (): Promise<{ data: CityInterface[] }> => {

        const db = await connect();
        await db.getConnection();

        const sql = `CALL show_city_all()`;

        const res = await db.query(sql);
        const cities = res.length === 2 ? res[0] : [];

        await db.end();

        return cities;

    },
};

