import mariadb from 'mariadb';
import conf from "./config/conf.json"
import testConf from "./config/testConf.json"
import prodConf from "./config/productionConf.json"

export const connect = () => {
    if ( process.env.NODE_ENV === 'test' ) {
        return mariadb.createPool(testConf);
    } else if (process.env.NODE_ENV === 'production'){
        return mariadb.createPool(prodConf);
    }
    return mariadb.createPool(conf);
};

let pool: mariadb.Pool;
if ( process.env.NODE_ENV === 'test' ) {
    pool = mariadb.createPool(testConf);
} else if (process.env.NODE_ENV === 'production'){
    pool = mariadb.createPool(prodConf);
} else {
    pool = mariadb.createPool(conf);
}

export async function fetchConn() {
    const conn = await pool.getConnection();
    console.log("Total connections: ", pool.totalConnections());
    console.log("Active connections: ", pool.activeConnections());
    console.log("Idle connections: ", pool.idleConnections());
    return conn;
}
