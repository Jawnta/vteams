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
Object.defineProperty(exports, "__esModule", { value: true });
exports.getUserInvoices = exports.updateUser = void 0;
const updateUser = (userDetails) => __awaiter(void 0, void 0, void 0, function* () {
    const requestOptions = {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(userDetails),
    };
    yield fetch(`/users/${userDetails.id}`, requestOptions);
});
exports.updateUser = updateUser;
const getUserInvoices = () => __awaiter(void 0, void 0, void 0, function* () {
    const response = yield fetch(`/users/`);
    return yield response.json();
});
exports.getUserInvoices = getUserInvoices;