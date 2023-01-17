import '../../css/ProfileCard.css';
function ProfileCard({...props}) {

    if(props.userData){
        return (
            <div className="profileCard">
                <div className="user-info">
                <p>Förnamn: {props.userData.first_name}</p>
                <p>Efternamn: {props.userData.last_name}</p>
                <p>Telefon: {props.userData.phone_number}</p>
                <p>Email: {props.userData.email}</p>
                <p>Personnummer: {props.userData.social_security}</p>
                <p>Kredit: {props.userData.credit} kr</p>
                </div>
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