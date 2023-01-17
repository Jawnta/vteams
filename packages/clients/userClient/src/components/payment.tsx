import AddFunds from "./forms/addFunds";
import '../css/AddFunds.css';

function Payment({...props}) {
    if(!props.userData){
        return(
            <h3>Loading</h3>
        )
    }
    return (

            <div className="add-funds">
                <h1>Lägg till kredit</h1>
                <AddFunds user={props.userData}/>
            </div>
    );
}

export default Payment;