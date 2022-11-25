const express = require('express');
const chargingstations = require('../services/chargingstations');
const router = new express.Router();
 
router.get('/', async (req, res, next) => {
  let options = { 
  };


  try {
    const result = await chargingstations.getChargingstations(options);
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

  options.chargingStation = req.body;

  try {
    const result = await chargingstations.postChargingstations(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.get('/zone/:chargingZoneId', async (req, res, next) => {
  let options = { 
    "chargingZoneId": req.params.chargingZoneId,
  };


  try {
    const result = await chargingstations.getZoneChargingZoneId(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.get('/:chargingStationId', async (req, res, next) => {
  let options = { 
    "chargingStationId": req.params.chargingStationId,
  };


  try {
    const result = await chargingstations.getChargingStationId(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.put('/:chargingStationId', async (req, res, next) => {
  let options = { 
    "chargingStationId": req.params.chargingStationId,
  };

  options.chargingStation = req.body;

  try {
    const result = await chargingstations.putChargingStationId(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.delete('/:chargingStationId', async (req, res, next) => {
  let options = { 
    "chargingStationId": req.params.chargingStationId,
  };


  try {
    const result = await chargingstations.deleteChargingStationId(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});

module.exports = router;