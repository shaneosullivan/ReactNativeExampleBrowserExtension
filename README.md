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
  This should create a folder called MyReactNativeExampleBrowserExtension.
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
8. In order for the project to compile properly (compilation, remember that headache from the 90's? Yeah, well welcome back to it :-( ), we'll add some "linker flags".  Select your extension's target in the project settings again, in this case `My Example Extension`.  Click the `Build Settings` tab, and make sure to click the `All` button just below the tabs, otherwise XCode will helpfully hide the property you need to set.  
  Scroll down to find the `Other Linker Flags` property, and double click on the row (do not expand it).  This pops up a dialog, where you should click the `+` icon.
  ![Add Linker Flags](https://github.com/shaneosullivan/ReactNativeExampleBrowserExtension/blob/master/ReadmeMedia/2d%20-%20Add%20Linker%20Flags.png)
  Add `-ObjC` and `-lc++` to this dialog.
  ![After Linker Flags](https://github.com/shaneosullivan/ReactNativeExampleBrowserExtension/blob/master/ReadmeMedia/2e%20-%20After%20Linker%20Flags.png)
9. To enable the app to load JavaScript we need to add an exception to the `App Transport Security Settings` to allow local files to be loaded.  The easiest way to do this is to copy the required text from the main app.  To do so, expand the main project section in the left bar, in this example `ReactNativeExampleBrowserExtension`, and choose the `Info.plist` file.  Right click on the `App Transport Security Settings` property and copy it.
![Copy Security Settings](https://github.com/shaneosullivan/ReactNativeExampleBrowserExtension/blob/master/ReadmeMedia/2f%20-%20Copy%20Security%20Settings.png)
Now expand the Extension section in the left bar, in this example `My Example Extension` and select the `Info.plist` file.  Right click and paste.  you should see the setting for `App Transport Security Settings` be replicated.
![Paste Security Settings](https://github.com/shaneosullivan/ReactNativeExampleBrowserExtension/blob/master/ReadmeMedia/2g%20-%20Paste%20Security%20Settings.png)
10. Now let's test out the app and make sure everything is working!  In your terminal, make sure that you are in the root folder of your React Native app, in this example a folder called `ReactNativeExampleBrowserExtension`, and not in the `ios` subfolder.  Run the command `react-native run-ios`, which should successfully build and run your app in the simulator.
11. Once your app is visible, close it using the Home button (Cmd-Shift-H), and open Safari.  Tap the share button on the bottom, and an action sheet should appear.  Your shiny new extension is not visible here yet, so we have to activate it.  (Sadly, end users will need to do the same when they install from the App Store.  Talk to your nearest Apple executive when you run into them hanging around cafes in Cupertino about this...)  Scroll the bottom row of icons all the way to the right and tap the `More` icon.  This should pop up a list containing the name of your extension, in this example `My Example Extension`.  Tap the toggle control to enable it and hit `Done`.  You should now see the empty icon for your extension in the action sheet.  Tap it, and you'll see the empty UI pop up with a `Done` button on the top.  Congrats, your app works!
![Paste Security Settings](https://github.com/shaneosullivan/ReactNativeExampleBrowserExtension/blob/master/ReadmeMedia/2h%20-%20App%20Extension%20iOS.png)

### Show React Native as the UI in the extension

The previous steps created the file `ActionViewController.m`, which defines what happens when the UI needs to load.  Take a look at it's contents, you will see the `viewDidLoad`
function containing the default code generated by XCode to render the UI.  We will replace this with a `loadView` function that creates a RCTRootView with the JavaScript code.

1. Add the following code to the top of `ActionViewController.m`
`
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
`
2. Add the following code below the line `@implementation ActionViewController` in `ActionViewController.m`
`
- (void)loadView {
    NSURL *jsCodeLocation;

    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];

    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:@"ReactNativeExampleBrowserExtension"
                                                 initialProperties:nil
                                                     launchOptions:nil];
    rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
    self.view = rootView;
}
`
Note that this code was mostly copied directly from `AppDelegate.m`, with `nil` replacing `launchOptions`
since there are no launch options.

¸3. Comment out the entire `viewDidLoad` function.
