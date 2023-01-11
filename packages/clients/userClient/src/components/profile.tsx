
import ProfileCard from './cards/profileCard';
import UpdateProfileForm from './forms/updateProfileForm';

function Profile({...props}) {
    if(!props.userData){
        return(
            <h3>Loading</h3>
        )
    }
    return (
        <div className="profile">
            <div>
                <h1>Profil</h1>
                <ProfileCard userData={props.userData}/>
            </div>
            <div>
                <h1>Ändra</h1>
                <UpdateProfileForm user={props.userData}/>
            </div>
            
        </div>
    );
}

export default Profile;