import ProfileInterface from "../interfaces/Profile"
import startTripInterface from "../interfaces/startTrip";
import StropTripInterface from "../interfaces/StopTrip";
import {API_URL } from '@env'
const apiUrl = API_URL

console.log("Url som används till api:", apiUrl)
export async function getUserDataFromApi(token: string) {
    const result = await fetch(`${apiUrl}/users/token/${token}`)
    const json = await result.json()
    return await(json[0])
}
export async function registerUser(profile:ProfileInterface) {
    const requestOptions = {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ 
            first_name: profile.given_name,
            last_name: profile.family_name,
            email: profile.email,
            token: profile.sub
        })
    };
    try {
        const response = await fetch(
        `${apiUrl}/users/`, requestOptions)
    }
    catch (error) {
    console.error(error);
    }
        
}

export async function getTripsForUser(id:number) {
    const result = await fetch(`${apiUrl}/users/${id}/trips`)
    const json = await result.json()
    return await(json)
}

export async function getInvoicesForUser(id:number) {
    const result = await fetch(`${apiUrl}/users/${id}/invoices`)
    const json = await result.json()
    return await(json)
}

//Ska man lägga till city_id?
export async function getScooters() {
    const result = await fetch(`${apiUrl}/scooters/available`)
    const json = await result.json()
    return await(json)
    
}

export async function getParkingzones() {
    const result = await fetch(`${apiUrl}/parkingzones`)
    const json = await result.json()
    return await(json)
    
}
export async function getChargingZones() {
    const result = await fetch(`${apiUrl}/chargingzones`)
    const json = await result.json()
    return await(json)
    
}

export async function startTrip(startTrip: startTripInterface) {
    const requestOptions = {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ 
            user_id:  startTrip.user_id,
            scooter_id: startTrip.scooter_id,
            start_position: startTrip.start_position,
        })
    };
    try {
    const result = await fetch(
    `${apiUrl}/trips`, requestOptions)
    const json = await result.json()
    return await(json)
    }
    catch (error) {
    console.error(error);
    }
        
}
export async function stopTrip(stopTrip: StropTripInterface) {
    const requestOptions = {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ 
            stop_position: stopTrip.stop_position,
        })
    };
    try {
    const result = await fetch(
    `${apiUrl}/trips/${stopTrip.trip_id}/end`, requestOptions)
    }
    catch (error) {
        console.error(error);
    }
        
}