import React from "react";
import { View, Text } from "react-native";
import User from "../interfaces/User";
import { useFocusEffect } from '@react-navigation/native';
import { getUserDataFromApi } from "../helperFunctions/apiCalls";

export default function Profile({ navigation, ...props }: any) {
  const [user, setUser] = React.useState<User>()

  useFocusEffect(
  React.useCallback(() => {
    async function getUserDetails() {
      setUser(await getUserDataFromApi(props.user.token));
    }
    getUserDetails();
  }, [])
  );
  if(!user){
    return(
        <View>
            <Text> Hämtar användardata</Text>
        </View>
    )
  }
  return (
    <View style={{ flex: 1, alignItems: "center", justifyContent: "center" }}>
      <Text style={{fontSize: 50}}>Profil</Text>
      <Text>Förnamn: {user.first_name}</Text>
      <Text>Efternamn: {user.last_name}</Text>
      <Text>Telefon: {user.phone_number}</Text>
      <Text>Email: {user.email}</Text>
      <Text>Kredit: {user.credit}</Text>
    </View>
  );
}