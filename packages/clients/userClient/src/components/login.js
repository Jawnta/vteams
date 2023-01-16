"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
function Login() {
    const handleSignInGoogle = () => {
        window.open("http://localhost:3000/login/google", "_self");
    };
    return (<div className="login">
            <h1>Login</h1>
            <button onClick={handleSignInGoogle}>Login with Google</button>
        </div>);
}
exports.default = Login;
