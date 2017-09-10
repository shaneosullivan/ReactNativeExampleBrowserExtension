// @flow

import React from 'react';
import { NativeModules, TouchableOpacity, Text, View } from 'react-native';

export default class ActionExtensionScreen extends React.Component {
  render() {
    return (
      <View style={{ paddingTop: 100 }}>
        <Text style={{ fontSize: 30, textAlign: 'center' }}>Hello from our Action Extension!</Text>
        <View style={{ paddingTop: 100 }}>
          <TouchableOpacity onPress={this._handleDone}>
            <View>
              <Text>Done</Text>
            </View>
          </TouchableOpacity>
        </View>
      </View>
    );
  }

  _handleDone = () => {
    NativeModules.ActionExtension.done();
  };
}
