import passport from "passport";
import passportGoogle from "passport-google-oauth20";
import {users} from '../services/users'
import { UserInterface } from '../interfaces/userInterface';
const CLIENTID = process.env.GOOGLE_CLIENT_ID || "xxx"
const CLIENTSECRET = process.env.GOOGLE_CLIENT_SECRET || "xxx"

async function authenticateUser(request: any, accessToken: any, refreshToken: any, profile: any, done: any) {

    const user = await users.getUserToken(profile.id)
    if(user.length == 0){
        const userDetails = {
            first_name: profile.name.givenName,
            last_name: profile.name.familyName,
            email: profile.emails[0].value as string,
            token: profile.id as string
    };
        const newUser = await users.postUsers(userDetails);
        return done(null, newUser);
    }
    console.log(profile)
    return done(null, user);
};

const GoogleStrategy = passportGoogle.Strategy;

passport.use(
    
    new GoogleStrategy(
        {
        clientID: CLIENTID,
        clientSecret: CLIENTSECRET,
        callbackURL: "/login/google/callback",
        }, authenticateUser));
        
// user object är "authenticated user" ifrån done() i authenticateUser.
// serializeUser() lägger till user i "req.session.passport.user.{user}", den knyts till session object för varje session.
passport.serializeUser( (user, done) => { 
    done(null, user);
});

// user är {user} ifrån req.session.passport.user.{user}
// deserializeUser lägger {user} i "req.user.{user}" så den går att nå överallt
passport.deserializeUser((user: UserInterface, done) => {
    done (null, user);
});

export const login = {
    /**
     *


     */
    getToken: async () => {
        return {token: 'test123'}
    },

    checkAuthenticated(req: any, res: any, next: any){
        if (req.isAuthenticated()) { return next() }
        res.redirect("/google/failed")
    },
};

