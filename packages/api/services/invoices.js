"use strict";
var __awaiter =
  (this && this.__awaiter) ||
  function (thisArg, _arguments, P, generator) {
    function adopt(value) {
      return value instanceof P
        ? value
        : new P(function (resolve) {
            resolve(value);
          });
    }
    return new (P || (P = Promise))(function (resolve, reject) {
      function fulfilled(value) {
        try {
          step(generator.next(value));
        } catch (e) {
          reject(e);
        }
      }
      function rejected(value) {
        try {
          step(generator["throw"](value));
        } catch (e) {
          reject(e);
        }
      }
      function step(result) {
        result.done
          ? resolve(result.value)
          : adopt(result.value).then(fulfilled, rejected);
      }
      step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
  };
Object.defineProperty(exports, "__esModule", { value: true });
exports.invoices = void 0;
exports.invoices = {
  /**
     *


     */
  getInvoices: () =>
    __awaiter(void 0, void 0, void 0, function* () {
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
      const data = [],
        status = 200;
      return {
        status: status,
        data: data,
      };
    }),
  /**
     *

     * @param options.amount required
     * @param options.id requiredThe unique identifier of an invoice
     * @param options.status required
     * @param options.trip_id requiredThe unique identifier of a trip

     */
  postInvoices: (options) =>
    __awaiter(void 0, void 0, void 0, function* () {
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
        status = 201;
      return {
        status: status,
        data: data,
      };
    }),
  /**
     *
     * @param invoiceId The unique identifier of the invoice

     */
  getInvoiceId: (invoiceId) =>
    __awaiter(void 0, void 0, void 0, function* () {
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
          amount: "<number>",
          id: "<InvoiceId>",
          status: "<string>",
          trip_id: "<TripId>",
        },
        status = 200;
      return {
        status: status,
        data: data,
      };
    }),
  /**
     *
     * @param options.invoiceId The unique identifier of the invoice
     * @param options.invoice.amount required
     * @param options.invoice.id requiredThe unique identifier of an invoice
     * @param options.invoice.status required
     * @param options.invoice.trip_id requiredThe unique identifier of a trip

     */
  putInvoiceId: (options) =>
    __awaiter(void 0, void 0, void 0, function* () {
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
        status = 200;
      return {
        status: status,
        data: data,
      };
    }),
  /**
     *
     * @param invoiceId The unique identifier of the invoice

     */
  deleteInvoiceId: (invoiceId) =>
    __awaiter(void 0, void 0, void 0, function* () {
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
        status = 204;
      return {
        status: status,
        data: data,
      };
    }),
};
