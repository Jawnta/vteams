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
exports.chargingStationRouter = void 0;
const express_1 = __importDefault(require("express"));
const chargingstations_1 = require("../services/chargingstations");
const router = express_1.default.Router();
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const result = yield chargingstations_1.chargingStations.getChargingStations();
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.post('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const data = req.body;
    try {
        const result = yield chargingstations_1.chargingStations.postChargingStations(data);
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.get('/zone/:chargingZoneId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const chargingZoneId = +req.params.chargingZoneId;
    try {
        const result = yield chargingstations_1.chargingStations.getZoneChargingZoneId(chargingZoneId);
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.get('/:chargingStationId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const chargingStationId = +req.params.chargingStationId;
    try {
        const result = yield chargingstations_1.chargingStations.getChargingStationId(chargingStationId);
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.put('/:chargingStationId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const chargingStation = req.body;
    const data = {
        chargingStationId: +req.params.chargingStationId,
        chargingStation: chargingStation,
    };
    try {
        const result = yield chargingstations_1.chargingStations.putChargingStationId(data);
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.delete('/:chargingStationId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const chargingStationId = +req.params.chargingStationId;
    try {
        const result = yield chargingstations_1.chargingStations.deleteChargingStationId(chargingStationId);
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
exports.chargingStationRouter = router;
