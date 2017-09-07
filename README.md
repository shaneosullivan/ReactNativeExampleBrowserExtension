# ReactNativeExampleBrowserExtension
Example React Native app that implements a browser extension.
This example was created with React Native version 0.48.1.  The instructions
may require updating for later versions.  This project builds on the great
instructions published by PromptWorks at https://www.promptworks.com/blog/building-ios-app-extensions-with-react-native
, which did a bit less than we're aiming for here, and were for an earlier version
of React Native so could be a bit out of date.

## Instructions for iOS (work in progress)
1. Create a React Native app, e.g.
  `react-native init MyReactNativeExampleBrowserExtension`
  This should create a folder called MyReactNativeExampleBrowserExtension in
2. Open the iOS app in XCode, using the file `MyReactNativeExampleBrowserExtension/ios/MyReactNativeExampleBrowserExtension.xcodeproj`

### Creating the Extension
3. Select your project in the left bar, click the `General` tab, and click the
   plus icon to add a new Target
   ![Add Target](https://github.com/shaneosullivan/ReactNativeExampleBrowserExtension/blob/master/ReadmeMedia/1a%20-%20Add%20New%20Target.png?raw=true)
4. Choose `Action Extension` to create the extension
  ![Choose Action Extensions](https://github.com/shaneosullivan/ReactNativeExampleBrowserExtension/blob/master/ReadmeMedia/1b%20-%20Choose%20Action%20Extension.png)
  Make sure to choose Objective-C as the language, and leave the default selection
  for `Action Type` to be `Presents User Interface`. For this example we will
  be showing a UI built with React Native when the extension is activated.
  ![Choose Objective C](https://github.com/shaneosullivan/ReactNativeExampleBrowserExtension/blob/master/ReadmeMedia/1c%20-%20Choose%20Objective-C.png)
  If you see a prompt to `Activate "My Example Extension" scheme`, click the `Activate` button.
  ![Activate Scheme](https://github.com/shaneosullivan/ReactNativeExampleBrowserExtension/blob/master/ReadmeMedia/1d%20-%20Activate%20Scheme.png)
5. At this point you have an Action Extension in your app.  Note that a new folder named after the name of the extension you chose, in this example `My Example Extension`, has been created in the `ios` folder, and contains three files, `ActionViewController.h`, `ActionViewController.m` and `Info.plist`.  We'll be
rewriting the code in `ActionViewController.m` pretty soon.
  ![Folder Layout](https://github.com/shaneosullivan/ReactNativeExampleBrowserExtension/blob/master/ReadmeMedia/1e%20-%20Folder%20Layout.png)

### Configure the Action Extension to use React Native
The goal of this section is to configure the Action Extension you've just created
to be the same as the main application.  This example was created with React Native
version 0.48.1, so if you're using a later version and your config is different, use the config in your app instead.

6. In XCode, click your project name in the left bar.  You may see a vertical list appear saying `Projects` and `Targets`, but if now, click the icon circled in the screenshot below to expand that UI control.  Click the first target, in this example `ReactNativeExampleBrowserExtension` and expand the `Link Binary With Libraries` section.  Note all the libraries in there, perhaps take a screenshot to avoid jumping back and forth.  You'll need to replicate them elsewhere.
  ![Note Libraries](https://github.com/shaneosullivan/ReactNativeExampleBrowserExtension/blob/master/ReadmeMedia/2a%20-%20Select%20Build%20Phases.png)
7. In the `Targets` list, select your extension, in this example `My Example Extension`. Click the `+` icon in the `Link Binary With Libraries` section and add
all of the libraries you saw in the main app config.
  ![Create Libraries](https://github.com/shaneosullivan/ReactNativeExampleBrowserExtension/blob/master/ReadmeMedia/2b%20-%20Add%20New%20Libraries.png)
  It should look like this when done
  ![After Creating Libraries](https://github.com/shaneosullivan/ReactNativeExampleBrowserExtension/blob/master/ReadmeMedia/2c%20-%20After%20Adding%20New%20Libraries.png)
