import * as Location from 'expo-location';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { useEffect, useState } from 'react';
import MapView, { Marker  } from 'react-native-maps';
import { Text, View, StyleSheet, Pressable } from 'react-native';
import Scooters from './scooters';
import Parkingzones from './parkingZones';
import ChargingZones from './chargingZones';
import MapLegend from './legend';
import User from '../../interfaces/User';
import { getUserDataFromApi, startTrip, stopTrip,  } from '../../helperFunctions/apiCalls';
import startTripInterface from '../../interfaces/startTrip';
import ScooterParseInterface from '../../interfaces/ScooterPost';
export default function Map({ navigation, ...props }:any) {
  const [location, setLocation] = useState<any>(null);
  const [filter, setFilter] = useState<Boolean>(false);
  const [parking, setParking] = useState<Boolean>(true);
  const [charging, setCharging] = useState<Boolean>(true);
  const [inTrip, setInTrip] = useState<Boolean>(false);
  const [tripId, setTripId] = useState<number | null>(null);
  const [selectedScooter, setSelectedScooter] = useState<ScooterParseInterface | null>(null);
//   const [selectedScooter, setSelectedScooter] = useState<number | null>(null);
  const token :string = props.user.token
  useEffect(() => {
	
    (async () => {
		
      let { status } = await Location.requestForegroundPermissionsAsync();
      if (status !== 'granted') {
        console.log('Permission to access location was denied');
        return;
      }
      let location = await Location.getCurrentPositionAsync({});
      setLocation(location);
      await getTripIdFromLocal()
    })();
  }, []);
  
  async function rentScooter(scooter_id:number) {
    const checkEnabled: User = await getUserDataFromApi(token)
	if(selectedScooter){
		if(checkEnabled.enabled && isNumber(selectedScooter.id)){
			const tripInfo: startTripInterface = {
			  user_id: props.user.id,
			  scooter_id: selectedScooter.id,
			  start_position: "{\"type\": \"Point\", \"coordinates\": [56.165411543029194, 15.58880082140956]}"
	  
			}
			const newTrip: [{id: number}] = await startTrip(tripInfo)
			console.log("NEW TRIP:",newTrip)
			if(isNumber(newTrip[0].id)){
			  setTripIdLocal(newTrip[0].id)
			  setTripId(newTrip[0].id)
			  setInTrip(true)
			  console.log("NU HYR JAG SCOOTER MED ID:", scooter_id)
			  console.log("Trip_Id", newTrip[0].id)
			}else{
			  console.log("svar från trip", newTrip[0].id)
			}
	  
		  } else {
			alert("Kontot är avstängt, vänligen kontakta kundservice")
		  }
	}

  }
  async function setTripIdLocal(id:number) {
    await AsyncStorage.setItem('@trip_id', id.toString())
  }
  async function removeTripIdLocal() {
	await AsyncStorage.removeItem('@trip_id')
	setInTrip(false)
  }
  async function getTripIdFromLocal() {
		const value = await AsyncStorage.getItem('@trip_id')
		if(value !== null) {
			setInTrip(true)
		} else {
			setInTrip(false)
			console.log("Ingen Trip")
		}
	}
  // refactor till något vettigt vid tillfälle
  function toggleFilter() {
    if(filter){
      setFilter(false)
      return
    } else {
      setFilter(true)
      return
    }
  }
  function toggleParking() {
    if(parking){
      setParking(false)
      return
    } else {
      setParking(true)
      return
    }
  }
  function toggleCharging() {
    if(charging){
      setCharging(false)
      return
    } else {
      setCharging(true)
      return
    }
  }
  async function stopTripForUser() {
	try{
		if (isNumber(tripId)) {
			const lat: number = await location.coords.latitude
			const longitude: number = await location.coords.longitude
			const stopTripData: any = {
				trip_id: tripId,
				stop_position: {type: 'point', coordinates: [lat, longitude]}
			}
			await stopTrip(stopTripData)
			await removeTripIdLocal()
		}
	}catch (error) {
		console.error(error);
	}
	
  }
  function isNumber(x: any): x is number {
    return typeof x === 'number';
}
  if (!location) {
    return(
      <View>
          <Text>Loading Map</Text>
      </View>
    )
  }

  return (
    <View style={styles.container}> 

        <MapView
          style={styles.mapView}
          onPress={()=>{setSelectedScooter(null)}}
          initialRegion={{
            latitude: location.coords.latitude,
            longitude: location.coords.longitude,
            latitudeDelta: 0.0922,
            longitudeDelta: 0.0421,
          }}
        >

            <Marker
              coordinate={{
                latitude: location.coords.latitude,
                longitude: location.coords.longitude,
              }}
            />
            {parking && 
            <Parkingzones/>
            }
            {charging && 
            <ChargingZones />
            }
            
            <Scooters setSelectedScooter={setSelectedScooter}/>
        </MapView>
        <MapLegend/>
        {
          inTrip &&
          <View style={styles.buttonContainer}>
            <Pressable style={styles.rent} onPress={()=>(stopTripForUser())}>
                <Text style={styles.text}>Stoppa Resa</Text>
            </Pressable>

          </View>
        }
        { selectedScooter && !inTrip &&
          <View style={styles.buttonContainer}>
            <Pressable style={styles.rent} onPress={()=>(rentScooter(selectedScooter.id))}>
			<Text style={styles.text}>Hyr scooter: {selectedScooter.id}</Text>
            </Pressable>
				
          </View>
        }

        { !selectedScooter && !inTrip &&
          <View style={styles.buttonContainer}>
            <Pressable style={styles.fiter} onPress={()=>(toggleFilter())}>
                <Text style={styles.text}>Filter</Text>
            </Pressable>
          </View>}
        {/* För att inte kartan ska "hoppa" på deselect */}

        {
          filter && !selectedScooter && !inTrip &&
          <View style={styles.buttonContainer}>
            <Pressable style={styles.fiter} onPress={()=>(toggleParking())}>
                <Text style={styles.text}>Parkering</Text>
            </Pressable>
            <Pressable style={styles.fiter} onPress={()=>(toggleCharging())}>
                <Text style={styles.text}>Laddning</Text>
            </Pressable>
          </View>
        }
    </View>
    
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  mapView: {
    flex: 0.9,
    width: '100%',
    height: '90%',
  },
  buttonContainer: {
    flex: 0.08,
    flexDirection: 'row',
  },
  buttonShape: {
    padding: 10
  },
  fiter: {
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 12,
    paddingHorizontal: 32,
    marginTop: 5,
    borderRadius: 4,
    elevation: 3,
    backgroundColor: 'black',
  },
  rent: {
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 12,
    paddingHorizontal: 32,
    marginTop: 5,
    borderRadius: 4,
    elevation: 3,
    backgroundColor: 'green',
  },
  text: {
    fontSize: 16,
    lineHeight: 21,
    fontWeight: 'bold',
    letterSpacing: 0.25,
    color: 'white',
  },
  mapButton: {
    position:'absolute',
    top:10,
    left: 10,
    alignSelf: "center",
    borderWidth: 0.5,
    borderRadius: 20,
    backgroundColor: 'black'
  },
});