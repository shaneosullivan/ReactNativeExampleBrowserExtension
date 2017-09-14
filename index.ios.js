/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import { AppRegistry, NativeModules, StyleSheet, Text, View } from 'react-native';
import PropTypes from 'prop-types';
import ActionExtensionScreen from './app/ActionExtensionScreen';

// DEV hack
NativeModules.DevSettings.setIsDebuggingRemotely(true);

export default class ReactNativeExampleBrowserExtension extends Component {
  static propTypes = {
    isActionExtension: PropTypes.number,
    webUrl: PropTypes.string
  };

  static defaultProps = {
    isActionExtension: false
  };

  componentDidUpdate() {
    console.log('Update: Root got props', this.props);
  }

  componentDidMount() {
    console.log('Mount: Root got props', this.props);
  }

  render() {
    if (this.props.isActionExtension) {
      return <ActionExtensionScreen webUrl={this.props.webUrl} />;
    } else {
      return (
        <View style={styles.container}>
          <Text style={styles.welcome}>Welcome to ReactNativeExampleBrowserExtension!</Text>
          <Text style={styles.instructions}>
            This app shows how to create a browser extension using React Native
          </Text>
          <Text style={styles.instructions}>
            You can mostly ignore this main app code, all the fun is in the extension and the
            README, which contains the instructions you should follow
          </Text>
        </View>
      );
    }
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF'
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5
  }
});

AppRegistry.registerComponent(
  'ReactNativeExampleBrowserExtension',
  () => ReactNativeExampleBrowserExtension
);
