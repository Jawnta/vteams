import React from "react";
import { View, Text } from "react-native";
import { FlatList } from 'react-native';
import { TripsTableHeader } from "./tables/TripsHeader";
import { TripsTableRow } from "./tables/TripsRow";
import { getTripsForUser } from "../helperFunctions/apiCalls";
import { Table } from 'react-native-table-component';
import TripsInterface from "../interfaces/Trips";
import { useFocusEffect } from '@react-navigation/native';
export default function TripsScreen({ navigation, ...props }: any) {
  const [trips, setTrips] = React.useState<TripsInterface[]>()
  const id: number = props.id
  useFocusEffect(
   
    React.useCallback(() => {
      async function getTrips() {
        setTrips(await getTripsForUser(id));
      }
      getTrips();
    }, [])
  );

  if(!trips){
    return (
      <View> 
          <Text> Hämtar Resor</Text>
      </View>
    )
  }
  return (
    <Table>
        <FlatList
          data={trips}
          ListHeaderComponent={() => <TripsTableHeader />}
          renderItem={({ item }) => <TripsTableRow trip={item} />}
          keyExtractor={item => item.id.toString()}
        />
      </Table>
  );
}
