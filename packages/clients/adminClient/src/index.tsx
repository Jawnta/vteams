import ReactDOM from "react-dom";
import { useState } from 'react';
import { BrowserRouter, Routes, Route } from "react-router-dom";
import {Layout} from "./components/layout/Layout";
import {Map} from "./views/Map";
import {Home} from "./views/Home";
import {NoPage} from "./views/NoPage";
import { Login } from "./components/login/Login";

export default function App() {
    const [token, setToken] = useState();
    if(!token) {
        return <Login setToken={setToken} />
    }
    return (
        <BrowserRouter>
            <Routes>
                <Route path="/" element={<Layout />}>
                    <Route index element={<Home />} />
                    <Route path="map" element={<Map />} />
                    <Route path="*" element={<NoPage />} />
                </Route>
            </Routes>
        </BrowserRouter>
    );
}

ReactDOM.render(<App />, document.getElementById("root"));