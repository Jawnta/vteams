import mariadb from 'mariadb';
import conf from "./config/conf.json"

export const connect = async () => {
    return mariadb.createPool(conf);
};

