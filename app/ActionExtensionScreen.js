// @flow

import React from 'react';
import { Text, View } from 'react-native';

export default class ActionExtensionScreen extends React.Component {
  render() {
    return (
      <View style={{ paddingTop: 100 }}>
        <Text style={{ fontSize: 30, textAlign: 'center' }}>Hello from our Action Extension!</Text>
      </View>
    );
  }
}
