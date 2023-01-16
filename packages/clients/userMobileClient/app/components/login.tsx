import {StyleSheet, Text, View, Button, Linking} from 'react-native';

function Login() {

    const handleSignInGoogle = () => {
        Linking.openURL("http://192.168.1.234:3000/login/google");   
    }
    return (
        <View> 
            <Button
                onPress={handleSignInGoogle}
                title="Login with Google"
                color="#841584"
                accessibilityLabel="Learn more about this purple button"
            />
        </View>
    );
}

export default Login;