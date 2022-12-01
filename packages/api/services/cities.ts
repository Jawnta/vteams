import { CityInterface } from '../interfaces/cityInterface';
import { connect } from "../db/dbConnection";
export const cities = {
    /**
     *


     */
    getCities: async (): Promise<{ status: number; data: CityInterface[] }> => {

        const db = await connect();
        await db.getConnection();

        const sql = `CALL show_city_all()`;

        const res = await db.query(sql);
        const cities = res[0] as CityInterface[];
        await db.end();

        const status = 200;

        return {
            status: status,
            data: cities
        };
    },
};

