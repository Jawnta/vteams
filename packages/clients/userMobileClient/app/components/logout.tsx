import * as React from 'react';
import { Button, View, Text, StyleSheet } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';

function LogOut({...props}) {
 
    async function removeIdInLocal() {
      await AsyncStorage.removeItem('@user_id')
    }

    return (
      <View style={styles.loginButtonSection}>
          <Button
          title="Logga ut"
          onPress={() => {
            removeIdInLocal();
            props.setId("")
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
export default LogOut;