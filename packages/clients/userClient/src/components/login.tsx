import "../css/Login.css";
function Login() {

    const handleSignInGoogle = () => {
        window.open("http://localhost:8080/login/google", "_self");   
    }
    return (
        <div className="login-wrapper">
        <div className="login">
            <button className="login-button" onClick={handleSignInGoogle}>Login with Google</button>
        </div>
        </div>
    );
}

export default Login;