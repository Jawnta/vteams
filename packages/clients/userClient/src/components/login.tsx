function Login() {

    const handleSignInGoogle = () => {
        window.open("http://localhost:8080/login/google", "_self");   
    }
    return (
        <div className="login">
            <h1>Login</h1>
            <button onClick={handleSignInGoogle}>Login with Google</button>
        </div>
    );
}

export default Login;