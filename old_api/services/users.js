module.exports = {
  /**
  * 


  */
  getUsers: async (options) => {

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

    var data = [{
        "credit": "<number>",
        "email": "<string>",
        "enabled": "<boolean>",
        "first_name": "<string>",
        "id": "<UserId>",
        "last_name": "<string>",
        "phone_number": "<integer>",
        "register_date": "<string>",
        "social_security": "<string>",
        "token": "<string>",
      }],
      status = '200';

    return {
      status: status,
      data: data
    };  
  },

  /**
  * 

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
  postUsers: async (options) => {

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

    var data = {},
      status = '201';

    return {
      status: status,
      data: data
    };  
  },

  /**
  * 
  * @param options.userId The unique identifier of the user 

  */
  getUserId: async (options) => {

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

    var data = {
        "credit": "<number>",
        "email": "<string>",
        "enabled": "<boolean>",
        "first_name": "<string>",
        "id": "<UserId>",
        "last_name": "<string>",
        "phone_number": "<integer>",
        "register_date": "<string>",
        "social_security": "<string>",
        "token": "<string>",
      },
      status = '200';

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
  putUserId: async (options) => {

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

    var data = {},
      status = '200';

    return {
      status: status,
      data: data
    };  
  },

  /**
  * 
  * @param options.userId The unique identifier of the user 

  */
  deleteUserId: async (options) => {

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

    var data = {},
      status = '204';

    return {
      status: status,
      data: data
    };  
  },

  /**
  * 
  * @param options.userId The unique identifier of the user 

  */
  getUserIdInvoices: async (options) => {

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

    var data = {
        "id": "<UserId>",
        "trips": "<array>",
      },
      status = '200';

    return {
      status: status,
      data: data
    };  
  },

  /**
  * 
  * @param options.userId The unique identifier of the user 

  */
  getUserIdTrips: async (options) => {

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

    var data = {
        "id": "<UserId>",
        "trips": "<Trips>",
      },
      status = '200';

    return {
      status: status,
      data: data
    };  
  },
};
