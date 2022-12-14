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
exports.chargingZoneRouter = void 0;
const express_1 = __importDefault(require("express"));
const chargingzones_1 = require("../services/chargingzones");
const router = express_1.default.Router();
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const result = yield chargingzones_1.chargingZones.getChargingZones();
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
    if (!data.parking_zone_id || !data.area) {
        res.sendStatus(400);
    }
    try {
        const result = yield chargingzones_1.chargingZones.postChargingZones(data);
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
        const result = yield chargingzones_1.chargingZones.getCityCityName(cityName);
        res.status(200).json(result);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.get('/:chargingZoneId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const chargingZoneId = +req.params.chargingZoneId;
    try {
        const result = yield chargingzones_1.chargingZones.getChargingZoneId(chargingZoneId);
        res.status(200).json(result);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.put('/:chargingZoneId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const chargingZone = req.body;
    if (!chargingZone.parking_zone_id || !chargingZone.area) {
        res.sendStatus(400);
    }
    try {
        const result = yield chargingzones_1.chargingZones.putChargingZoneId(chargingZone);
        res.status(200).json(result);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.delete('/:chargingZoneId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const chargingZoneId = +req.params.chargingZoneId;
    try {
        const result = yield chargingzones_1.chargingZones.deleteChargingZoneId(chargingZoneId);
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
exports.chargingZoneRouter = router;
