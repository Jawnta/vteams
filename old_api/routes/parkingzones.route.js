const express = require('express');
const parkingzones = require('../services/parkingzones');
const router = new express.Router();
 
router.get('/', async (req, res, next) => {
  let options = { 
  };


  try {
    const result = await parkingzones.getParkingzones(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.post('/', async (req, res, next) => {
  let options = { 
  };

  options.parkingZone = req.body;

  try {
    const result = await parkingzones.postParkingzones(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.get('/city/:cityName', async (req, res, next) => {
  let options = { 
    "cityName": req.params.cityName,
  };


  try {
    const result = await parkingzones.getCityCityName(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.get('/:parkingZoneId', async (req, res, next) => {
  let options = { 
    "parkingZoneId": req.params.parkingZoneId,
  };


  try {
    const result = await parkingzones.getParkingZoneId(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.put('/:parkingZoneId', async (req, res, next) => {
  let options = { 
    "parkingZoneId": req.params.parkingZoneId,
  };

  options.parkingZone = req.body;

  try {
    const result = await parkingzones.putParkingZoneId(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.delete('/:parkingZoneId', async (req, res, next) => {
  let options = { 
    "parkingZoneId": req.params.parkingZoneId,
  };


  try {
    const result = await parkingzones.deleteParkingZoneId(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});

module.exports = router;