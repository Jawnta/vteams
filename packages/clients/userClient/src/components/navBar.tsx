function NavBar({...props}) {

    return (
        <div className='ButtonBar'> 
            <button onClick={()=>{
                props.updatePage("Profile")
            }}>Profil</button>
            <button onClick={()=>{
                props.updatePage("Trips")
            }}>Resor</button>
            <button onClick={()=>{
                props.updatePage("Invoices")
            }}>Fakturor</button>

        </div>
    );
}

export default NavBar;