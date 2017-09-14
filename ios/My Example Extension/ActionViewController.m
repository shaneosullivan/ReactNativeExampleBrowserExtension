//
//  ActionViewController.m
//  My Example Extension
//
//  Created by Shane O'Sullivan on 06/09/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "ActionViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

@interface ActionViewController ()

@end

ActionViewController * actionViewController = nil;

@implementation ActionViewController


- (void)initMyView:(NSString *) url {
  // foo
  NSURL *jsCodeLocation;
  jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];

  if (url == (id)[NSNull null] || url == nil) {
    url = @"";
  }
  NSDictionary *initialProps =  [NSDictionary dictionaryWithObjects:@[url,@TRUE]
                                                    forKeys:@[@"webUrl",@"isActionExtension"]];

  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"ReactNativeExampleBrowserExtension"
                                               initialProperties:initialProps
                                                   launchOptions:nil];
  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
  self.view = rootView;
  self.reactView = rootView;
}

- (void)loadView {

  [self initMyView:@"not getting url"];

  actionViewController = self;
}

- (void)viewDidLoad {
  NSArray *inputItems = self.extensionContext.inputItems;

  NSExtensionItem *extensionItem = inputItems[0];
  NSItemProvider *itemProvider = extensionItem.attachments[0];

  // Do a lot of work to get the URL.
  // Reference: http://www.pixeldock.com/blog/ios8-share-extension-completionhandler-for-loaditemfortypeidentifier-is-never-called/
  if ([itemProvider hasItemConformingToTypeIdentifier:@"public.url"]) {
    [itemProvider loadItemForTypeIdentifier:@"public.url"
                                    options:nil
                          completionHandler:^(NSURL *url, NSError *error) {

                            NSString *urlString = url.absoluteString;
                            self.domainUrl = urlString;

                            NSDictionary *initialProps =  [NSDictionary dictionaryWithObjects:@[urlString,@TRUE]
                                                                                      forKeys:@[@"webUrl",@"isActionExtension"]];

                            // This does nothing for some reason.
                            self.reactView.appProperties = initialProps;
                          }];
  }
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (NSDictionary*)getUpdatedProps {
  // Hacky callback method of fetching updated props from React native.
  // This should not be necessary, because setting appProperties should correctly update the properties.
  NSDictionary *initialProps =  [NSDictionary dictionaryWithObjects:@[self.domainUrl,@TRUE]
                                                            forKeys:@[@"webUrl",@"isActionExtension"]];
  return initialProps;
}

- (IBAction)done {
  // Return any edited content to the host app.
  // This template doesn't do anything, so we just echo the passed in items.
  [self.extensionContext completeRequestReturningItems:self.extensionContext.inputItems completionHandler:nil];
  actionViewController = nil;
}

@end
