module.exports = {
  /**
  * 


  */
  getChargingstations: async (options) => {

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
        "charging_zone_id": "<ChargingZoneId>",
        "id": "<ChargingStationId>",
        "occupied": "<boolean>",
        "position": "<Coordinates>",
      }],
      status = '200';

    return {
      status: status,
      data: data
    };  
  },

  /**
  * 

  * @param options.chargingStation.charging_zone_id requiredThe unique identifer of a charging zone
  * @param options.chargingStation.id requiredThe unique identifier of a charging station
  * @param options.chargingStation.occupied required
  * @param options.chargingStation.position required

  */
  postChargingstations: async (options) => {

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
  * @param options.chargingZoneId The unique identifier of the charging zone 

  */
  getZoneChargingZoneId: async (options) => {

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
        "charging_zone_id": "<ChargingZoneId>",
        "id": "<ChargingStationId>",
        "occupied": "<boolean>",
        "position": "<Coordinates>",
      }],
      status = '200';

    return {
      status: status,
      data: data
    };  
  },

  /**
  * 
  * @param options.chargingStationId The unique identifier of the charging station 

  */
  getChargingStationId: async (options) => {

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
        "charging_zone_id": "<ChargingZoneId>",
        "id": "<ChargingStationId>",
        "occupied": "<boolean>",
        "position": "<Coordinates>",
      },
      status = '200';

    return {
      status: status,
      data: data
    };  
  },

  /**
  * 
  * @param options.chargingStationId The unique identifier of the charging station 
  * @param options.chargingStation.charging_zone_id requiredThe unique identifer of a charging zone
  * @param options.chargingStation.id requiredThe unique identifier of a charging station
  * @param options.chargingStation.occupied required
  * @param options.chargingStation.position required

  */
  putChargingStationId: async (options) => {

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
  * @param options.chargingStationId The unique identifier of the charging station 

  */
  deleteChargingStationId: async (options) => {

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
