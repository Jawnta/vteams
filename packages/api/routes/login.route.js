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
exports.loginRouter = void 0;
const express_1 = __importDefault(require("express"));
const login_1 = require("../services/login");
const passport_1 = __importDefault(require("passport"));
const cors_1 = __importDefault(require("cors"));
const router = express_1.default.Router();
function getToken(user) {
    return user[0].token;
}
router.post('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const result = yield login_1.login.getToken();
        res.send(result);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.get('/google', passport_1.default.authenticate('google', {
    scope: ['email', 'profile']
}));
router.get("/google/callback", passport_1.default.authenticate('google', {
    successRedirect: '/login/google/success',
    failureRedirect: '/login/google/failure'
}));
router.get("/google/failed", (req, res) => {
    return res.status(500).send({
        message: 'Something went wrong.'
    });
});
router.get("/google/success", login_1.login.checkAuthenticated, (0, cors_1.default)(), (req, res) => {
    // const query = stringify(req.user[0].token)
    // const backURL=req.header('Referer') || "/"
    // const test = req.get('Referrer')
    // console.log(test)
    // const expires = body.exp.toUTCString();
    const token = getToken(req.user);
    res.cookie('id_token', token);
    // res.redirect(test +`worked?${token}`)
    res.redirect(`http://localhost:1339`);
    // return res.status(200).header('Access-Control-Allow-Origin', '*').json(req.user).redirect("back")
});
exports.loginRouter = router;
