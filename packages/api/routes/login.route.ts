import express from 'express';
import {login} from '../services/login';
import passport from "passport";
import cors from 'cors';
const router = express.Router();

function getToken(user: any){
    return user[0].token
}
router.post('/', async (req: any, res: any)  => {

    try {
        const result = await login.getToken();
        res.send(result);
    } catch (err) {

        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
});

router.get('/google',
    passport.authenticate('google', {
            scope:
                ['email', 'profile']
            
        }
));

router.get("/google/callback",
    passport.authenticate( 'google', {
        successRedirect: '/login/google/success',
        failureRedirect: '/login/google/failure'
}));

router.get("/google/failed", (req, res) => {
    return res.status(500).send({
        message: 'Something went wrong.'
    });
})

router.get("/google/success", login.checkAuthenticated, cors(), (req, res) => {

    const token = getToken(req.user)
    res.cookie('id_token', token);
    res.redirect(`http://localhost:8889`)
  })

export const loginRouter = router;
