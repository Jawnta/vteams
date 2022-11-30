import {CityInterface} from '../interfaces/cityInterface';
export const cities = {
    /**
     *


     */
    getCities: async () => {
        // Implement your business logic here...
        //
        // Return all 2xx and 4xx as follows:
        //
        // return {
        //   status: 'statusCode',
        //   data: 'response'
        // }

        // If an error happens during your business logic implementation,
        // you can throw it as follows:
        //
        // throw new Error('<Error message>'); // this will result in a 500

        const data: CityInterface[] = [],
            status = '200';

        return {
            status: status,
            data: data,
        };
    },
};
