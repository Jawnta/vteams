export const invoices = {
    /**
     *


     */
    getInvoices: async (options) => {

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

        const data = [{
                "amount": "<number>",
                "id": "<InvoiceId>",
                "status": "<string>",
                "trip_id": "<TripId>",
            }],
            status: number = 200;

        return {
            status: status,
            data: data
        };
    },

    /**
     *

     * @param options.invoice.amount required
     * @param options.invoice.id requiredThe unique identifer of an invoice
     * @param options.invoice.status required
     * @param options.invoice.trip_id requiredThe unique identifier of a trip

     */
    postInvoices: async (options) => {

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
            status: number = 201;

        return {
            status: status,
            data: data
        };
    },

    /**
     *
     * @param options.invoiceId The unique identifier of the invoice

     */
    getInvoiceId: async (options) => {

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
                "amount": "<number>",
                "id": "<InvoiceId>",
                "status": "<string>",
                "trip_id": "<TripId>",
            },
            status: number = 200;

        return {
            status: status,
            data: data
        };
    },

    /**
     *
     * @param options.invoiceId The unique identifier of the invoice
     * @param options.invoice.amount required
     * @param options.invoice.id requiredThe unique identifer of an invoice
     * @param options.invoice.status required
     * @param options.invoice.trip_id requiredThe unique identifier of a trip

     */
    putInvoiceId: async (options) => {

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
     * @param options.invoiceId The unique identifier of the invoice

     */
    deleteInvoiceId: async (options) => {

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
};
