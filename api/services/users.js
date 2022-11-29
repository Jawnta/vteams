"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.users = void 0;
exports.users = {
    /**
     *


     */
    getUsers: () => __awaiter(void 0, void 0, void 0, function* () {
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
        const data = [], status = 200;
        return {
            status: status,
            data: data
        };
    }),
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
    postUsers: (options) => __awaiter(void 0, void 0, void 0, function* () {
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
        const data = {};
        const status = 201;
        return {
            status: status,
            data: data
        };
    }),
    /**
     *
     * @param userId The unique identifier of the user

     */
    getUserId: (userId) => __awaiter(void 0, void 0, void 0, function* () {
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
        const data = {}, status = 200;
        return {
            status: status,
            data: data
        };
    }),
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
    putUserId: (options) => __awaiter(void 0, void 0, void 0, function* () {
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
        const data = {}, status = 200;
        return {
            status: status,
            data: data
        };
    }),
    /**
     *
     * @param options.userId The unique identifier of the user

     */
    deleteUserId: (options) => __awaiter(void 0, void 0, void 0, function* () {
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
        const data = {}, status = 204;
        return {
            status: status,
            data: data
        };
    }),
    /**
     *
     * @param userId The unique identifier of the user

     */
    getUserIdInvoices: (userId) => __awaiter(void 0, void 0, void 0, function* () {
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
        }, status = 200;
        return {
            status: status,
            data: data
        };
    }),
    /**
     *
     * @param options.userId The unique identifier of the user

     */
    getUserIdTrips: (options) => __awaiter(void 0, void 0, void 0, function* () {
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
        }, status = 200;
        return {
            status: status,
            data: data
        };
    }),
};
