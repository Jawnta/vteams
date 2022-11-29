import { UserInterface } from "../interfaces/userInterface";
export const users = {
    /**
     *


     */
    getUsers: async () => {

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

        const data: UserInterface[] = [],
            status: number = 200;

        return {
            status: status,
            data: data
        };
    },

    /**
     *

     * @param options.creditCurrent credit balance
     * @param options.email required
     * @param options.enabled requiredReturns false if user is disabled
     * @param options.first_name required
     * @param options.id requiredThe unique identifier of a user
     * @param options.last_name required
     * @param options.phone_number required
     * @param options.register_date required
     * @param options.social_security requiredSocial security number such as Swedish personnummer
     * @param options.tokenLogin token for authentication

     */
    postUsers: async (options: UserInterface) => {

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

        const data = {}
        const status = 201;

        return {
            status: status,
            data: data
        };
    },

    /**
     *
     * @param userId The unique identifier of the user

     */
    getUserId: async (userId: number) => {

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

        const data: {} = {},
            status: number = 200;

        return {
            status: status,
            data: data
        };
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
    putUserId: async (options: { userId: number; user: UserInterface[] }) => {

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

        const data = {},
            status: number = 200;

        return {
            status: status,
            data: data
        };
    },

    /**
     *
     * @param options.userId The unique identifier of the user

     */
    deleteUserId: async (options: number) => {

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

        const data = {},
            status: number = 204;

        return {
            status: status,
            data: data
        };
    },

    /**
     *
     * @param userId The unique identifier of the user

     */
    getUserIdInvoices: async (userId: number) => {

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

        const data = {
                "id": "<UserId>",
                "trips": "<array>",
            },
            status: number = 200;

        return {
            status: status,
            data: data
        };
    },

    /**
     *
     * @param options.userId The unique identifier of the user

     */
    getUserIdTrips: async (options: number) => {

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

        const data = {
                "id": "<UserId>",
                "trips": "<Trips>",
            },
            status: number = 200;

        return {
            status: status,
            data: data
        };
    },
};
