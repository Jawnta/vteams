module.exports = {
  /**
  * 


  */
  getChargingzones: async (options) => {

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
        "id": "<ChargingZoneId>",
        "parking_zone_id": "<integer>",
      }],
      status = '200';

    return {
      status: status,
      data: data
    };  
  },

  /**
  * 

  * @param options.chargingZone.area required
  * @param options.chargingZone.id requiredThe unique identifer of a charging zone
  * @param options.chargingZone.parking_zone_id required

  */
  postChargingzones: async (options) => {

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
  * @param options.cityName Name of the city where the charging zones are located 

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
  * @param options.chargingZoneId The unique identifier of the charging zone 

  */
  getChargingZoneId: async (options) => {

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
        "id": "<ChargingZoneId>",
        "parking_zone_id": "<integer>",
      },
      status = '200';

    return {
      status: status,
      data: data
    };  
  },

  /**
  * 
  * @param options.chargingZoneId The unique identifier of the charging zone 
  * @param options.chargingZone.area required
  * @param options.chargingZone.id requiredThe unique identifer of a charging zone
  * @param options.chargingZone.parking_zone_id required

  */
  putChargingZoneId: async (options) => {

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
  * @param options.chargingZoneId The unique identifier of the charging zone 

  */
  deleteChargingZoneId: async (options) => {

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
