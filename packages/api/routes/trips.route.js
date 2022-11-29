"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const trips_1 = require("../services/trips");
const router = express_1.default.Router();
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const result = yield trips_1.trips.getTrips();
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.'
        });
    }
}));
router.post('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const tripData = req.body;
    try {
        const result = yield trips_1.trips.postTrips(tripData);
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.'
        });
    }
}));
router.get('/:tripId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const tripId = +req.params.tripId;
    try {
        const result = yield trips_1.trips.getTripId(tripId);
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.'
        });
    }
}));
router.put('/:tripId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const trip = req.body;
    const data = {
        tripId: +req.params.tripId,
        trip: trip
    };
    try {
        const result = yield trips_1.trips.putTripId(data);
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.'
        });
    }
}));
router.delete('/:tripId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const tripId = +req.params.tripId;
    try {
        const result = yield trips_1.trips.deleteTripId(tripId);
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.'
        });
    }
}));
module.exports = router;