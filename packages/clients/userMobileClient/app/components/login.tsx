import * as React from 'react';
import * as WebBrowser from 'expo-web-browser';
import * as Google from 'expo-auth-session/providers/google';
import { Button, View, Text, StyleSheet } from 'react-native';
import jwt_decode from "jwt-decode";
import AsyncStorage from '@react-native-async-storage/async-storage';
import ProfileInterface from '../interfaces/Profile';
import {getUserDataFromApi, registerUser} from '../helperFunctions/apiCalls';
WebBrowser.maybeCompleteAuthSession();

function Login({...props}) {
  const antiCheat = '918890602830-nf6jeo3ivjr2evtlt8m19ts20lsks9tf'
  const antiCheat2 = '.apps.googleusercontent.com'
  const [request, response, promptAsync] = Google.useIdTokenAuthRequest({
    expoClientId: antiCheat + antiCheat2,
    iosClientId: antiCheat + antiCheat2,
    androidClientId: antiCheat + antiCheat2,
  });

    async function setIdInLocal(id:string) {
      await AsyncStorage.setItem('@user_id', id)
    }
    async function checkIfUserExists(profile:ProfileInterface) {
      const user = await getUserDataFromApi(profile.sub)
      if(!user){
        registerUser(profile)
      }
    }

	React.useEffect(() => {
          async function awaitExists() {
            if (response?.type === 'success') {
              const { authentication } = response;
              const decodedToken : ProfileInterface = jwt_decode(response.params.id_token)
              await setIdInLocal(decodedToken.sub)
              await checkIfUserExists(decodedToken)
              props.render()
              }
          }
          awaitExists()

  	}, [response]);

    return (
      <View style={styles.loginButtonSection}>
          <Button
          disabled={!request}
          title="Login With Google"
          onPress={() => {
              promptAsync();
          }}
          />
      </View>
    );
}
const styles = StyleSheet.create({

  loginButtonSection: {
     width: '100%',
     height: '100%',
     justifyContent: 'center',
     alignItems: 'center'
  },
})
export default Login;

