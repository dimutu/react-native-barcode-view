import * as React from 'react';

import { StyleSheet, View } from 'react-native';
import { BarcodeViewView } from 'react-native-barcode-view';

export default function App() {
  return (
    <View style={styles.container}>
      <BarcodeViewView value="091234586" style={styles.box} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 200,
    height: 150,
    marginVertical: 20,
  },
});
