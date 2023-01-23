import React, {useState, useEffect} from 'react'
import User from '../../interfaces/user';
import "../../css/UpdateProfileForm.css";

function AddFunds({...props}) {
    const [payBool, setPayBool] = useState(false);
    const [tempFund, setTempFund] = useState<number>(0);
    const [tempCVC, setTempCVC] = useState(0);
    const [tempCard, setTempCard] = useState(0);
    // useEffect(() => {
    //     setTempUser(props.user)
    // }, []);
    const updateFund = (value: number) => {
        setTempFund(value)
    }
    const updateCard = (value: number) => {
        setTempCard(value)
    }
    const updateCVC = (value: number) => {
        setTempCVC(value)
    }
    const handleSubmit = (event: React.MouseEvent) => {
        event.preventDefault();
      };

 
        

    async function addFundsToUser(fundsToAdd:number) {
        console.log(fundsToAdd)
        const data ={
            user_id: props.user.id,
            funds: fundsToAdd
        }

        const requestOptions = {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify(data),
        };
        try{
            // LÄGGER TILL TEMPORÄR LÄNK TILLS VI HAR EN TRANSAKTION
            const response = await fetch(`http://localhost:8080/users/${props.user.id}/funds`, requestOptions);
            setTempFund(fundsToAdd)
        } catch (error) {
            console.error(error);
          }
    }
    if(props.user && !payBool){
        return (
            <div className="user-form">
            <form >
                <div className="user-form-input">
                    <input 
                        type="number"
                        name="credit"
                        required
                        min={100}
                        value={tempFund}
                        onChange={e => updateFund(+e.target.value)}
                    />
                </div>

                <div className="user-form-button">
                <button
                    onClick={async (e) => {
                    handleSubmit(e);
                    setPayBool(true);
                    }}>Lägg till kredit
                </button>
                </div>
            </form>
            </div>
        );
    }
    if(payBool){
        return (
            <div className="user-form">
            <form >
                <div className="user-form-input">
                <label>Ange kreditkort:</label>
                    <input 
                        type="int"
                        name="credit"
                        maxLength={16}
                        minLength={14}
                        required
                        value={tempCard || 0}
                        onChange={e => updateCard(+e.target.value)}
                    />

                </div>
                <div className="user-form-input">
                <label>Ange CVC:</label>
                    <input 
                        type="int"
                        name="cvc"
                        maxLength={3}
                        minLength={3}
                        required
                        value={tempCVC || 0}
                        onChange={e => updateCVC(+e.target.value)}
                    />

                </div>
                <div className="user-form-button">
                <button
                    onClick={async (e) => {
                    handleSubmit(e);
                    await addFundsToUser(tempFund);
                    }}>Lägg till kredit
                </button>
                </div>
            </form>
            </div>

        );
    }
    return (
        <div>
            <p>Loading...</p>
        </div>
    )
    
}

export default AddFunds;