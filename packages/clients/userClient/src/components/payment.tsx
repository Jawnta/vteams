import AddFunds from "./forms/addFunds";

function Payment({...props}) {
    if(!props.userData){
        return(
            <h3>Loading</h3>
        )
    }
    return (
        <div className="payment">
            <div>
                <h1>Lägg till kredit</h1>
                <AddFunds user={props.userData}/>
            </div>
        </div>
    );
}

export default Payment;