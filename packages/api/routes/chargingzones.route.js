"use strict";
var __awaiter =
  (this && this.__awaiter) ||
  function (thisArg, _arguments, P, generator) {
    function adopt(value) {
      return value instanceof P
        ? value
        : new P(function (resolve) {
            resolve(value);
          });
    }
    return new (P || (P = Promise))(function (resolve, reject) {
      function fulfilled(value) {
        try {
          step(generator.next(value));
        } catch (e) {
          reject(e);
        }
      }
      function rejected(value) {
        try {
          step(generator["throw"](value));
        } catch (e) {
          reject(e);
        }
      }
      function step(result) {
        result.done
          ? resolve(result.value)
          : adopt(result.value).then(fulfilled, rejected);
      }
      step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
  };
var __importDefault =
  (this && this.__importDefault) ||
  function (mod) {
    return mod && mod.__esModule ? mod : { default: mod };
  };
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const chargingzones_1 = require("../services/chargingzones");
const router = express_1.default.Router();
router.get("/", (req, res) =>
  __awaiter(void 0, void 0, void 0, function* () {
    try {
      const result = yield chargingzones_1.chargingZones.getChargingZones();
      res.status(result.status || 200).send(result.data);
    } catch (err) {
      return res.status(500).send({
        error: err || "Something went wrong.",
      });
    }
  })
);
router.post("/", (req, res) =>
  __awaiter(void 0, void 0, void 0, function* () {
    const data = req.body;
    try {
      const result = yield chargingzones_1.chargingZones.postChargingZones(
        data
      );
      res.status(result.status || 200).send(result.data);
    } catch (err) {
      return res.status(500).send({
        error: err || "Something went wrong.",
      });
    }
  })
);
router.get("/city/:cityName", (req, res) =>
  __awaiter(void 0, void 0, void 0, function* () {
    const cityName = req.params.cityName;
    try {
      const result = yield chargingzones_1.chargingZones.getCityCityName(
        cityName
      );
      res.status(result.status || 200).send(result.data);
    } catch (err) {
      return res.status(500).send({
        error: err || "Something went wrong.",
      });
    }
  })
);
router.get("/:chargingZoneId", (req, res) =>
  __awaiter(void 0, void 0, void 0, function* () {
    const chargingZoneId = +req.params.chargingZoneId;
    try {
      const result = yield chargingzones_1.chargingZones.getChargingZoneId(
        chargingZoneId
      );
      res.status(result.status || 200).send(result.data);
    } catch (err) {
      return res.status(500).send({
        error: err || "Something went wrong.",
      });
    }
  })
);
router.put("/:chargingZoneId", (req, res) =>
  __awaiter(void 0, void 0, void 0, function* () {
    const chargingZone = req.body;
    const data = {
      chargingZoneId: +req.params.chargingZoneId,
      chargingZone: chargingZone,
    };
    try {
      const result = yield chargingzones_1.chargingZones.putChargingZoneId(
        data
      );
      res.status(result.status || 200).send(result.data);
    } catch (err) {
      return res.status(500).send({
        error: err || "Something went wrong.",
      });
    }
  })
);
router.delete("/:chargingZoneId", (req, res) =>
  __awaiter(void 0, void 0, void 0, function* () {
    const chargingZoneId = +req.params.chargingZoneId;
    try {
      const result = yield chargingzones_1.chargingZones.deleteChargingZoneId(
        chargingZoneId
      );
      res.status(result.status || 200).send(result.data);
    } catch (err) {
      return res.status(500).send({
        error: err || "Something went wrong.",
      });
    }
  })
);
module.exports = router;
