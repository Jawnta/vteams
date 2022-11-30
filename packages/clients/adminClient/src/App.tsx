import React, {useState} from 'react';
import logo from './logo.svg';
import './App.css';

const apiUrl = 'http://localhost:3000';
function App() {
    const [users, setUsers] = useState<any[]>([]);
    async function fetchData() {
        await fetch('/chargingstations', {method: 'GET', mode: 'cors'})
            .then((res) => res.json())
            .then((json) => {
                setUsers(json);
                console.log(json);
            });
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
                <button onClick={testLog}>console.log that shit</button>
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
