const express = require('express');
const chargingzones = require('../services/chargingzones');
const router = new express.Router();
 
router.get('/', async (req, res, next) => {
  let options = { 
  };


  try {
    const result = await chargingzones.getChargingzones(options);
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

  options.chargingZone = req.body;

  try {
    const result = await chargingzones.postChargingzones(options);
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
    const result = await chargingzones.getCityCityName(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.get('/:chargingZoneId', async (req, res, next) => {
  let options = { 
    "chargingZoneId": req.params.chargingZoneId,
  };


  try {
    const result = await chargingzones.getChargingZoneId(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.put('/:chargingZoneId', async (req, res, next) => {
  let options = { 
    "chargingZoneId": req.params.chargingZoneId,
  };

  options.chargingZone = req.body;

  try {
    const result = await chargingzones.putChargingZoneId(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.delete('/:chargingZoneId', async (req, res, next) => {
  let options = { 
    "chargingZoneId": req.params.chargingZoneId,
  };


  try {
    const result = await chargingzones.deleteChargingZoneId(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});

module.exports = router;