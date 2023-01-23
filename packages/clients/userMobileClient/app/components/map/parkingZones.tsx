import React, { useState, useEffect} from "react";
import { Polygon } from 'react-native-maps';
import { getParkingzones } from "../../helperFunctions/apiCalls";
import ParkingZonePre from "../../interfaces/parkingZonePre";

const Parkingzones = () => {
    const [parkingZones, setParkingZones] = useState<ParkingZonePre[] | null>(null);
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
                    strokeColor="#0B2B62"
                    fillColor="rgba(0, 3, 240, 0.2)"
                    strokeWidth={1}
                />
            )
        });
        setGeo(polyCreation)
    }

    async function getAllParkingZones() {
        const PKZList = await getParkingzones()
        setParkingZones(await PKZList)
        createPolygons(await PKZList)
    }

    useEffect(() => {
        async function getGeoZonesInHook() {
         await getAllParkingZones()
        }
        getGeoZonesInHook()
    }, []);

    if(geo){
        return (
            geo
        );
    } else {
        getAllParkingZones()
    }


}

export default Parkingzones;