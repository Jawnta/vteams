
import ProfileCard from './cards/profileCard';
import UpdateProfileForm from './forms/updateProfileForm';
import '../css/Profile.css';

function Profile({...props}) {
    if(!props.userData){
        return(
            <h3>Loading</h3>
        )
    }
    return (
        <div className="profile-wrapper">
            <div className="profile">
                <h1>Profil</h1>
                <ProfileCard userData={props.userData}/>
            </div>
            <div className="update-profile">
                <h1>Uppdatera profil</h1>
                <UpdateProfileForm user={props.userData}/>
            </div>
            <div>
            </div>
            
        </div>
    );
}

export default Profile;