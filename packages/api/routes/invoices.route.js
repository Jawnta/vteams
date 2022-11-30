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
const invoices_1 = require("../services/invoices");
const router = express_1.default.Router();
router.get("/", (req, res, next) =>
  __awaiter(void 0, void 0, void 0, function* () {
    try {
      const result = yield invoices_1.invoices.getInvoices();
      res.status(result.status || 200).send(result.data);
    } catch (err) {
      return res.status(500).send({
        error: err || "Something went wrong.",
      });
    }
  })
);
router.post("/", (req, res, next) =>
  __awaiter(void 0, void 0, void 0, function* () {
    const data = req.body;
    try {
      const result = yield invoices_1.invoices.postInvoices(data);
      res.status(result.status || 200).send(result.data);
    } catch (err) {
      return res.status(500).send({
        error: err || "Something went wrong.",
      });
    }
  })
);
router.get("/:invoiceId", (req, res, next) =>
  __awaiter(void 0, void 0, void 0, function* () {
    const invoiceId = +req.params.invoiceId;
    try {
      const result = yield invoices_1.invoices.getInvoiceId(invoiceId);
      res.status(result.status || 200).send(result.data);
    } catch (err) {
      return res.status(500).send({
        error: err || "Something went wrong.",
      });
    }
  })
);
router.put("/:invoiceId", (req, res, next) =>
  __awaiter(void 0, void 0, void 0, function* () {
    const invoice = req.body;
    const data = {
      invoiceId: +req.params.invoiceId,
      invoice: invoice,
    };
    try {
      const result = yield invoices_1.invoices.putInvoiceId(data);
      res.status(result.status || 200).send(result.data);
    } catch (err) {
      return res.status(500).send({
        error: err || "Something went wrong.",
      });
    }
  })
);
router.delete("/:invoiceId", (req, res, next) =>
  __awaiter(void 0, void 0, void 0, function* () {
    const invoiceId = +req.params.invoiceId;
    try {
      const result = yield invoices_1.invoices.deleteInvoiceId(invoiceId);
      res.status(result.status || 200).send(result.data);
    } catch (err) {
      return res.status(500).send({
        error: err || "Something went wrong.",
      });
    }
  })
);
module.exports = router;
