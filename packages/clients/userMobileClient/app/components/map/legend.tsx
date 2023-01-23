import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

const MapLegend = () => {
    return (
        <View style={styles.legendContainer}>
            <Text style={styles.text}>parkeringszoner: <Text style={{color: 'blue'}}> Blå </Text> </Text>
            <Text style={styles.text}>Laddzoner: <Text style={{color: 'green'}}> Grön </Text> </Text>
        </View>
    );
};

const styles = StyleSheet.create({
    legendContainer: {
        position: 'absolute',
        zIndex: 1,
        top: 10,
        left: 10,
        backgroundColor: 'white',
        padding: 10
    },
    text: {
        fontSize: 14,
    }
})

export default MapLegend;