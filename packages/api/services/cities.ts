import { CityInterface } from '../interfaces/cityInterface';
import {fetchConn} from "../db/dbConnection";

export const cities = {
    /**
     *


     */
    getCities: async (): Promise<{ data: CityInterface[] }> => {
        const conn = await fetchConn();
        const sql = `CALL show_city_all()`;
        const res = await conn.query(sql);
        const cities = res.length === 2 ? res[0] : [];
        await conn.release();

        return cities;

    },
};

