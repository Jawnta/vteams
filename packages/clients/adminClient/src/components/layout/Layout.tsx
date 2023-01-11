import React from "react";
import {Navbar} from "./Navbar";
import {Header} from "./Header";
import {Main} from "./Main";


export const Layout = () => {
    return (
        <>
            <Header />
            <Navbar />
            <Main />
        </>
    );
};
