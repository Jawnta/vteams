import React, {useState} from 'react';
import logo from './logo.svg';
import './App.css';

const apiUrl = 'http://localhost:3000';
function App() {
    const [users, setUsers] = useState<any[]>([]);
    async function fetchData() {
        await fetch('http://localhost:3000/login/google', {method: 'GET', headers: { 'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': '*'}, credentials: 'same-origin'})
        .then((res) => res.json())
        .then((json) => {
            setUsers(json);
            console.log(json);
        });
    }
    const handleSignInGoogle = () => {
        window.open("http://localhost:3000/login/google", "_self");   
    }
    function testLog() {
        console.log(users);
    }

    let testcount = 0;
    return (
        <div className="App">
            <header className="App-header">
                <img src={logo} className="App-logo" alt="logo" />
                <h1>HELLO WORLD</h1>

                <h3>Hello From API</h3>
                <button onClick={fetchData}>Get Users</button>
                <button onClick={handleSignInGoogle}>GOOGLE</button>
                <ul>
                    {Array.isArray(users)
                        ? users.map((user) => (
                              <li key={testcount++}>
                                  {user.name} - {user.test}{' '}
                              </li>
                          ))
                        : null}
                </ul>
            </header>
        </div>
    );
}

export default App;
