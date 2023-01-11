import ReactDOM from "react-dom";
import {useEffect, useState} from 'react';
import { BrowserRouter, Routes, Route } from "react-router-dom";
import {Layout} from "./components/layout/Layout";
import {Map} from "./views/map/Map";
import {Home} from "./views/home/Home";
import {NoPage} from "./views/NoPage";
import { Login } from "./components/login/Login";
import {UserDetails} from "./views/userdetails/UserDetails";
import {UserDetailsInvoices} from "./views/userdetails/UserDetailsInvoices";
import {UserDetailsForm} from "./views/userdetails/UserDetailsForm";
import {InvoiceDetails} from "./views/invoicedetails/InvoiceDetails";
import {Scooters} from "./views/scooters/Scooters";
import {ScooterDetails} from "./views/scooterdetails/ScooterDetails";


export default function App() {
    const [token, setToken] = useState<string | null>();
    useEffect(() => {
        setToken(localStorage.getItem("token"));

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
                    <Route path='users/:userId' element={<UserDetails />}>
                        <Route path='overview' element={<UserDetailsForm />} />
                        <Route path='invoices' element={<UserDetailsInvoices />} />
                    </Route>
                    <Route path="invoiceDetails" element={<InvoiceDetails />} />
                    <Route path="scooters" element={<Scooters />} />
                    <Route path="scooterDetails" element={<ScooterDetails />} />
                <Route/>

                    <Route path="*" element={<NoPage />} />
                </Route>
            </Routes>
        </BrowserRouter>
    );
}

ReactDOM.render(<App />, document.getElementById("root"));