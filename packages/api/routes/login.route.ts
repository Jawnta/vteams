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
    // const query = stringify(req.user[0].token)
    // const backURL=req.header('Referer') || "/"
    // const test = req.get('Referrer')
    // console.log(test)
    const token = getToken(req.user)
    // res.redirect(test +`worked?${token}`)
    res.status(302).redirect(`http://localhost:1339?${token}`)
    // return res.status(200).header('Access-Control-Allow-Origin', '*').json(req.user).redirect("back")
  })

export const loginRouter = router;
