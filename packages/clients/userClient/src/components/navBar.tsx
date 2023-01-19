import "../css/Navbar.css";
import {deleteCookie} from "../helperFunc/cookie";
function NavBar({...props}) {

    return (
        <div className='navbar'>

                <ul>
                    <li><button onClick={()=>{
                props.updatePage("Profile")
            }}>Profil</button>
                    </li>
                    <li>
            <button onClick={()=>{
                props.updatePage("Trips")
            }}>Resor</button>
                    </li>
                    <li>
            <button onClick={()=>{
                props.updatePage("Invoices")
            }}>Fakturor</button>
                    </li>
                        <li>
            <button onClick={()=>{
                props.updatePage("Payment")
            }}>Kredit</button>
                        </li>

                    <li>
                        <button onClick={()=>{
                            deleteCookie();
                            window.location.reload();
                        }}>Log out</button>
                    </li>
                </ul>

        </div>
    );
}

export default NavBar;