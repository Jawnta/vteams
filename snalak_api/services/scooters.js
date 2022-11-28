module.exports = {
  /**
  * 


  */
  getScooters: async (options) => {

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
        "available": "<boolean>",
        "charge": "<number>",
        "city_id": "<CityId>",
        "distance_traveled": "<number>",
        "enabled": "<boolean>",
        "first_used": "<string>",
        "id": "<ScooterId>",
        "is_charging": "<boolean>",
        "last_position": "<Coordinates>",
        "last_serviced": "<string>",
      }],
      status = '200';

    return {
      status: status,
      data: data
    };  
  },

  /**
  * 

  * @param options.scooter.available requiredReturns false if scooter is unavailable
  * @param options.scooter.charge required
  * @param options.scooter.city_id requiredThe unique identifer of a city
  * @param options.scooter.distance_traveled required
  * @param options.scooter.enabled required
  * @param options.scooter.first_used required
  * @param options.scooter.id requiredThe unique identifer of a scooter
  * @param options.scooter.is_charging required
  * @param options.scooter.last_position required
  * @param options.scooter.last_serviced required

  */
  postScooters: async (options) => {

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


  */
  getAvailable: async (options) => {

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
        "available": "<boolean>",
        "charge": "<number>",
        "city_id": "<CityId>",
        "distance_traveled": "<number>",
        "enabled": "<boolean>",
        "first_used": "<string>",
        "id": "<ScooterId>",
        "is_charging": "<boolean>",
        "last_position": "<Coordinates>",
        "last_serviced": "<string>",
      }],
      status = '200';

    return {
      status: status,
      data: data
    };  
  },

  /**
  * 
  * @param options.cityName Name of the city where the scooters are located 

  */
  getCityCityName: async (options) => {

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
        "available": "<boolean>",
        "charge": "<number>",
        "city_id": "<CityId>",
        "distance_traveled": "<number>",
        "enabled": "<boolean>",
        "first_used": "<string>",
        "id": "<ScooterId>",
        "is_charging": "<boolean>",
        "last_position": "<Coordinates>",
        "last_serviced": "<string>",
      }],
      status = '200';

    return {
      status: status,
      data: data
    };  
  },

  /**
  * 
  * @param options.scooterId The unique identifier of the scooter 

  */
  getScooterId: async (options) => {

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
        "available": "<boolean>",
        "charge": "<number>",
        "city_id": "<CityId>",
        "distance_traveled": "<number>",
        "enabled": "<boolean>",
        "first_used": "<string>",
        "id": "<ScooterId>",
        "is_charging": "<boolean>",
        "last_position": "<Coordinates>",
        "last_serviced": "<string>",
      },
      status = '200';

    return {
      status: status,
      data: data
    };  
  },

  /**
  * 
  * @param options.scooterId The unique identifier of the scooter 
  * @param options.scooter.available requiredReturns false if scooter is unavailable
  * @param options.scooter.charge required
  * @param options.scooter.city_id requiredThe unique identifer of a city
  * @param options.scooter.distance_traveled required
  * @param options.scooter.enabled required
  * @param options.scooter.first_used required
  * @param options.scooter.id requiredThe unique identifer of a scooter
  * @param options.scooter.is_charging required
  * @param options.scooter.last_position required
  * @param options.scooter.last_serviced required

  */
  putScooterId: async (options) => {

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
  * @param options.scooterId The unique identifier of the scooter 

  */
  deleteScooterId: async (options) => {

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
  * @param options.scooterId The unique identifier of the scooter 

  */
  getScooterIdLogs: async (options) => {

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
        "charge": "<number>",
        "id": "<integer>",
        "position": "<Coordinates>",
        "scooter_id": "<ScooterId>",
        "speed": "<number>",
        "status": "<string>",
        "timestamp": "<string>",
      }],
      status = '200';

    return {
      status: status,
      data: data
    };  
  },
};
