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
3. Select your project in the left bar, click the `General` tab, and click the
   plus icon to add a new Target
   ![Add Target](https://github.com/shaneosullivan/ReactNativeExampleBrowserExtension/blob/master/ReadmeMedia/1a%20-%20Add%20New%20Target.png?raw=true)
4. Choose `Action Extension` to create the extension
  ![Choose Action Extensions](https://github.com/shaneosullivan/ReactNativeExampleBrowserExtension/blob/master/ReadmeMedia/1b%20-%20Choose%20Action%20Extension.png)
  Make sure to choose Objective-C as the language.
  ![Choose Objective C](https://github.com/shaneosullivan/ReactNativeExampleBrowserExtension/blob/master/ReadmeMedia/1c%20-%20Choose%20Objective-C.png)
  If you see a prompt to `Activate "My Example Extension" scheme`, click the `Activate` button.
  ![Activate Scheme](https://github.com/shaneosullivan/ReactNativeExampleBrowserExtension/blob/master/ReadmeMedia/1d%20-%20Activate%20Scheme.png)
5. At this point you have an Action Extension in your app.  Note that a new folder named after the name of the extension you chose, in this example `My Example Extension`, has been created in the `ios` folder, and contains three files, `ActionViewController.h`, `ActionViewController.m` and `Info.plist`.  We'll be
rewriting the code in `ActionViewController.m` pretty soon.
  ![Folder Layout](https://github.com/shaneosullivan/ReactNativeExampleBrowserExtension/blob/master/ReadmeMedia/1e%20-%20Folder%20Layout.png)
