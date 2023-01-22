import React from "react";
import { Text } from "react-native";
import ScooterInterface from "../../interfaces/ScooterPre";
import ScooterParseInterface from "../../interfaces/ScooterPost";
import { Marker, Callout, } from 'react-native-maps';
import { useEffect, useState } from "react";
import { getScooters } from "../../helperFunctions/apiCalls";

export default function Scooters( {setSelectedScooter}: any): any {
    const [scooters, setScooters] = useState<ScooterParseInterface[]| any>()
    const [markers, setMarkers] = useState([]);
    async function parseCoordinates(scooterList:ScooterInterface[]) {
        scooterList.forEach(scooter => {
            scooter.last_position = JSON.parse(scooter.last_position)
        });
        setScooters(scooterList)
        
    }

    function scooterMarkerList(scooterList: ScooterParseInterface[]) {
        const scooterMarkers: any = scooterList.map((scooter) => (
            <Marker 
            key={scooter.id}
            coordinate={{
                latitude: scooter.last_position.coordinates[0],
                longitude: scooter.last_position.coordinates[1]
            }}
            onPress={() => setSelectedScooter(scooter)}
            image={require('../images/sBike.png')}
            >
                <Callout >
                    <Text>Id: {scooter.id}</Text>
                    <Text>Batteri: {scooter.charge}</Text>
                </Callout>
            </Marker>
            
        ))
        setMarkers(scooterMarkers)
        
    }
    async function getAllScooters() {
        const scooterList = await getScooters()
        await parseCoordinates(scooterList)
        scooterMarkerList(await scooterList)
    }
    useEffect(() => {
        (async () => {
            await getAllScooters()
        })();
      }, []);
    
    if(!scooters){
        getAllScooters()
    } else if(!markers) {
        scooterMarkerList(scooters)
    } else {
        return (
            markers
        );
    
    }
    
}