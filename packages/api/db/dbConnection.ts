import mariadb from 'mariadb';
import conf from "./config/conf.json"

export const dbConnection = async () => {
    return mariadb.createPool(conf);
};

