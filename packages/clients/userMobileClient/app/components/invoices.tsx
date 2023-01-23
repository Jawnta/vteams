import React from "react";
import { View, Text } from "react-native";
import { FlatList } from 'react-native';
import { InvoicesTableHeader } from "./tables/InvoicesHeader";
import { InvoicesTableRow } from "./tables/InvoicesRow";
import { getInvoicesForUser } from "../helperFunctions/apiCalls";
import { Table } from 'react-native-table-component';
import InvoicesInterface from "../interfaces/Invoices";
import { useFocusEffect } from '@react-navigation/native';
export default function InvoiceScreen({ navigation, ...props }: any) {
  const [Invoices, setInvoices] = React.useState<InvoicesInterface[]>()
  const id: number = props.id
  
  useFocusEffect(
    React.useCallback(() => {
      async function getInvoices() {
        setInvoices(await getInvoicesForUser(id));
      }
      getInvoices();
    }, [])
  );


  if(!Invoices){
    return (
      <View> 
          <Text> Hämtar Fakturor </Text>
      </View>
    )
  }
  return (
    <Table>
        <FlatList
          data={Invoices}
          ListHeaderComponent={() => <InvoicesTableHeader />}
          renderItem={({ item }) => <InvoicesTableRow invoice={item} />}
          keyExtractor={item => item.id.toString()}
        />
      </Table>
  );
}
