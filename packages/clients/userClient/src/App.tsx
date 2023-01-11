import React, {useState, useEffect} from 'react';
import logo from './logo.svg';
import './css/App.css';
import Login from './components/login';
import getCookie from './helperFunc/cookie';
import Profile from './components/profile';
import UserTrips from './components/userTrips';
import UserInvoices from './components/userInvoices';
import NavBar from './components/navBar';
import User from './interfaces/user';
function App() {
    const authCookie = getCookie('id_token')
    const [user, setUser] = useState<User>();
    const [page, setPage] = useState('Profile');

    useEffect(() => {
        const getUser = async () => {
            const response = await fetch(`/users/token/${authCookie}`);
            const jsonResp = await response.json()
            setUser(jsonResp[0]);
        };
        getUser()
    }, []);
    function updatePage(pageToShow : string){
        setPage(pageToShow)
    }

    if(!authCookie) {
        return <Login />
    }

    return (
        <div className="App">
            <header className="App-header">
                <img src={logo} className="App-logo" alt="logo" />
                <h1>Snålåk Main</h1>
                <NavBar updatePage={updatePage}/>
            </header>
            <div>
            {
                {
                'Profile': <Profile  userData={user}/>,
                'Trips': <UserTrips userData={user}/>,
                'Invoices': <UserInvoices userData={user}/>
                }[page]
            }
            </div>
        </div>
    );
}

export default App;
