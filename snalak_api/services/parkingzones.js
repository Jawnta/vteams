module.exports = {
  /**
  * 


  */
  getParkingzones: async (options) => {

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
        "area": "<Geometry>",
        "city_id": "<CityId>",
        "id": "<ParkingZoneId>",
      }],
      status = '200';

    return {
      status: status,
      data: data
    };  
  },

  /**
  * 

  * @param options.parkingZone.area required
  * @param options.parkingZone.city_id requiredThe unique identifer of a city
  * @param options.parkingZone.id requiredThe unique identifier of a parking zone

  */
  postParkingzones: async (options) => {

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
  * @param options.cityName Name of the city where the parking zones are located 

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
        "area": "<Geometry>",
        "city_id": "<CityId>",
        "id": "<ParkingZoneId>",
      }],
      status = '200';

    return {
      status: status,
      data: data
    };  
  },

  /**
  * 
  * @param options.parkingZoneId The unique identifier of the parking zone 

  */
  getParkingZoneId: async (options) => {

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
        "area": "<Geometry>",
        "city_id": "<CityId>",
        "id": "<ParkingZoneId>",
      },
      status = '200';

    return {
      status: status,
      data: data
    };  
  },

  /**
  * 
  * @param options.parkingZoneId The unique identifier of the parking zone 
  * @param options.parkingZone.area required
  * @param options.parkingZone.city_id requiredThe unique identifer of a city
  * @param options.parkingZone.id requiredThe unique identifier of a parking zone

  */
  putParkingZoneId: async (options) => {

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
  * @param options.parkingZoneId The unique identifier of the parking zone 

  */
  deleteParkingZoneId: async (options) => {

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
};
