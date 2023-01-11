function ProfileCard({...props}) {

    if(props.userData){
        return (
            <div className="profileCard">
                <p>Förnamn: {props.userData.first_name}</p>
                <p>Efternamn: {props.userData.last_name}</p>
                <p>Telfon: {props.userData.phone_number}</p>
                <p>Email: {props.userData.email}</p>
                <p>Personnummer: {props.userData.social_security}</p>
                <p>Kredit: {props.userData.credit} kr</p>
            </div>
        );
    }
    return (
        <div>
            <p>Loading...</p>
        </div>
    )
    
}

export default ProfileCard;