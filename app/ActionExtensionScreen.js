// @flow

import React from 'react';
import PropTypes from 'prop-types';
import { NativeModules, TouchableOpacity, Text, View } from 'react-native';

export default class ActionExtensionScreen extends React.Component {
  static propTypes = {
    webUrl: PropTypes.string
  };

  render() {
    return (
      <View style={{ paddingTop: 100 }}>
        <Text style={{ fontSize: 30, textAlign: 'center' }}>Hello from our Action Extension!</Text>
        {this.props.webUrl
          ? <Text>
              Got url {this.props.webUrl}
            </Text>
          : <Text>Got no url</Text>}
        <View style={{ paddingTop: 100 }}>
          <TouchableOpacity onPress={this._handleDone}>
            <Text style={{ fontSize: 30, textAlign: 'center' }}>Done</Text>
          </TouchableOpacity>
        </View>
      </View>
    );
  }

  _handleDone = () => {
    // Call the function that has been exposed on the native module to close the screen.
    NativeModules.ActionExtension.done();
  };
}
