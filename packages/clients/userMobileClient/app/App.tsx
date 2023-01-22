import * as React from 'react';
import { View, Text, Button, StyleSheet } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Login from './components/login';
import User from './interfaces/User';
import { getUserDataFromApi } from './helperFunctions/apiCalls';
import { NavigationContainer } from "@react-navigation/native";
import Profile from './components/profile';
import InvoiceScreen from './components/invoices';
import TripsScreen from './components/trips';
import Map from './components/map/map';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import LogOut from './components/logout';
import Ionicons from '@expo/vector-icons/Ionicons'

const Tab = createBottomTabNavigator();
export default function App() {

	const [id, setId] = React.useState("")
	const [user, setUser] = React.useState<User>()
	
	async function getIdFromLocal() {
		const value = await AsyncStorage.getItem('@user_id')
		if(value !== null) {
			setId(value)
		} else {
			console.log("Inget id hittat")
		}
	}
	async function getUser() {
		setUser(await getUserDataFromApi(id))
	}
	React.useEffect(() => {
		getIdFromLocal()
		getUser()	
	},[]);
	async function reRenderAfterLogin(){
		await getIdFromLocal()
		await getUser()
	}
   if(!id) {

    return (
      <Login render={reRenderAfterLogin}/>
    );
   }

  if(!user){
	getUser()
	return(
		<View style={styles.loginButtonSection}>
		<Button
		title="Logout"
		onPress={() => {
			setId("");
		}}
		/>
	</View>
	)
  }
	return(
		<NavigationContainer>
		<Tab.Navigator 
		        screenOptions={({ route }) => ({
					tabBarIcon: ({ focused, color, size }) => {
					  let iconName;
		  
					  if (route.name === 'Profil') {
						iconName = focused
						  ? 'body'
						  : 'body-outline';
					  } else if (route.name === 'Karta') {
						iconName = focused ? 'map' : 'map-outline';
					  } else if (route.name === 'Fakturor') {
						iconName = focused ? 'mail-open' : 'mail';
					  } else if (route.name === 'Resor') {
						iconName = focused ? 'rocket-outline' : 'rocket';
					  } else if (route.name === 'Logout') {
						iconName = focused ? 'log-out-outline' : 'log-out';
					  }
		  
					  // You can return any component that you like here!
					  //@ts-ignore
					  return <Ionicons name={iconName} size={size} color={color} />;
					},
					tabBarActiveTintColor: 'tomato',
					tabBarInactiveTintColor: 'gray',
				  })}>
			<Tab.Screen name="Profil">
				{(props) => <Profile {...props} user={user} />}
			</Tab.Screen>
			<Tab.Screen name="Fakturor">
				{(props) => <InvoiceScreen {...props} id={user.id} />}
			</Tab.Screen>
			<Tab.Screen name="Resor">
				{(props) => <TripsScreen {...props} id={user.id} />}
			</Tab.Screen>
			<Tab.Screen name="Karta">
				{(props) => <Map  {...props} user={user} />}
			</Tab.Screen>
			<Tab.Screen name="Logout">
				{(props) => <LogOut  {...props} setId={setId}/>}
			</Tab.Screen>
		</Tab.Navigator>
	  </NavigationContainer>
	  
	)




}
const styles = StyleSheet.create({

	loginButtonSection: {
	   width: '100%',
	   height: '100%',
	   justifyContent: 'center',
	   alignItems: 'center'
	},
  })