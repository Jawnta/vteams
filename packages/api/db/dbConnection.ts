import mariadb from 'mariadb';
import conf from "./config/conf.json"
import testConf from "./config/testConf.json"
import prodConf from "./config/productionConf.json"

export const connect = async () => {
    if ( process.env.NODE_ENV === 'test' ) { 
        return mariadb.createPool(testConf);  
    } else if (process.env.NODE_ENV === 'production'){
        return mariadb.createPool(prodConf);  
    }
    return mariadb.createPool(conf);
};

