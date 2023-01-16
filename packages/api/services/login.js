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
exports.login = void 0;
const passport_1 = __importDefault(require("passport"));
const passport_google_oauth20_1 = __importDefault(require("passport-google-oauth20"));
const users_1 = require("../services/users");
const CLIENTID = process.env.GOOGLE_CLIENT_ID || "xxx";
const CLIENTSECRET = process.env.GOOGLE_CLIENT_SECRET || "xxx";
function authenticateUser(request, accessToken, refreshToken, profile, done) {
    return __awaiter(this, void 0, void 0, function* () {
        const user = yield users_1.users.getUserToken(profile.id);
        if (user.length == 0) {
            const userDetails = {
                first_name: profile.name.givenName,
                last_name: profile.name.familyName,
                email: profile.emails[0].value,
                token: profile.id
            };
            const newUser = yield users_1.users.postUsers(userDetails);
            return done(null, newUser);
        }
        console.log(profile);
        return done(null, user);
    });
}
;
const GoogleStrategy = passport_google_oauth20_1.default.Strategy;
passport_1.default.use(new GoogleStrategy({
    clientID: CLIENTID,
    clientSecret: CLIENTSECRET,
    callbackURL: "/login/google/callback",
}, authenticateUser));
// user object är "authenticated user" ifrån done() i authenticateUser.
// serializeUser() lägger till user i "req.session.passport.user.{user}", den knyts till session object för varje session.
passport_1.default.serializeUser((user, done) => {
    done(null, user);
});
// user är {user} ifrån req.session.passport.user.{user}
// deserializeUser lägger {user} i "req.user.{user}" så den går att nå överallt
passport_1.default.deserializeUser((user, done) => {
    done(null, user);
});
exports.login = {
    /**
     *


     */
    getToken: () => __awaiter(void 0, void 0, void 0, function* () {
        return { token: 'test123' };
    }),
    checkAuthenticated(req, res, next) {
        if (req.isAuthenticated()) {
            return next();
        }
        res.redirect("/google/failed");
    },
};
