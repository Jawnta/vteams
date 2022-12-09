import ReactDOM from "react-dom";
import {useEffect, useState} from 'react';
import { BrowserRouter, Routes, Route } from "react-router-dom";
import {Layout} from "./components/layout/Layout";
import {Map} from "./views/Map";
import {Home} from "./views/home/Home";
import {NoPage} from "./views/NoPage";
import { Login } from "./components/login/Login";
import {UserDetails} from "./views/UserDetails";


export default function App() {
    const [token, setToken] = useState<string | null>();
    useEffect(() => {
        setToken(sessionStorage.getItem("token"));

    }, []);

    if(!token) {
        return <Login setToken={setToken} />
    }
    return (
        <BrowserRouter>
            <Routes>
                <Route path="/" element={<Layout />}>
                    <Route index element={<Home />} />
                    <Route path="map" element={<Map />} />
                    <Route path='users/:id' element={<UserDetails />} />
                    <Route path="*" element={<NoPage />} />
                </Route>
            </Routes>
        </BrowserRouter>
    );
}

ReactDOM.render(<App />, document.getElementById("root"));