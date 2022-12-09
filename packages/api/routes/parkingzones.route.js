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
exports.parkingZonesRouter = void 0;
const express_1 = __importDefault(require("express"));
const parkingzones_1 = require("../services/parkingzones");
const router = express_1.default.Router();
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const result = yield parkingzones_1.parkingZones.getParkingZones();
        res.status(200).json(result);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.post('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const data = req.body;
    if (!data.city_id || !data.area) {
        res.sendStatus(400);
    }
    try {
        const result = yield parkingzones_1.parkingZones.postParkingZones(data);
        res.status(200).json(result);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.get('/city/:cityName', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const cityName = req.params.cityName;
    try {
        console.log(cityName);
        const result = yield parkingzones_1.parkingZones.getCityCityName(cityName);
        res.status(200).json(result);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.get('/:parkingZoneId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const parkingZoneId = +req.params.parkingZoneId;
    try {
        const result = yield parkingzones_1.parkingZones.getParkingZoneId(parkingZoneId);
        res.status(200).json(result);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.put('/:parkingZoneId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const parkingZone = req.body;
    const data = {
        parkingZoneId: +req.params.parkingZoneId,
        parkingZone: parkingZone,
    };
    if (!parkingZone.city_id || !parkingZone.area) {
        res.sendStatus(400);
    }
    try {
        const result = yield parkingzones_1.parkingZones.putParkingZoneId(data);
        res.status(200).json(result);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.delete('/:parkingZoneId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const parkingZoneId = +req.params.parkingZoneId;
    try {
        const result = yield parkingzones_1.parkingZones.deleteParkingZoneId(parkingZoneId);
        if (!result.affectedRows) {
            res.sendStatus(400);
        }
        res.sendStatus(200);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
exports.parkingZonesRouter = router;
