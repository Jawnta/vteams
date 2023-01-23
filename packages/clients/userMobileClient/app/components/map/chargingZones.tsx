import React, { useState, useEffect} from "react";
import { Polygon } from 'react-native-maps';
import { getChargingZones } from "../../helperFunctions/apiCalls";
import ParkingZonePre from "../../interfaces/parkingZonePre";

const ChargingZones = () => {
    const [ChargingZones, setChargingZones] = useState<ParkingZonePre[] | null>(null);
    const [geo, setGeo] = useState<any>(null);

    const createPolygons = async ( data: ParkingZonePre[]) => {
        const polyCreation = data.map(item => {
            const area = JSON.parse(item.area);
            let listLatLang:any = []
            area.coordinates[0].forEach((item: number[][]) => {
                const latLang = {
                    latitude: item[0],
                    longitude: item[1],
                }
                listLatLang.push(latLang)
            });
            return (
                <Polygon
                    key={item.id}
                    coordinates={listLatLang}
                    strokeColor="#00FF09"
                    fillColor="rgba(0, 254, 8, 0.5)"
                    strokeWidth={1}
                    zIndex={1}
                />
            )
        });
        setGeo(polyCreation)
    }

    async function getAllChargingZones() {
        const chargZones = await getChargingZones()
        setChargingZones(await chargZones)
        createPolygons(await chargZones)
    }

    useEffect(() => {
        async function getGeoZonesInHook() {
         await getAllChargingZones()
        }
        getGeoZonesInHook()
    }, []);

    if(geo){
        return (
            geo
        );
    } else {
        getAllChargingZones()
    }


}

export default ChargingZones;