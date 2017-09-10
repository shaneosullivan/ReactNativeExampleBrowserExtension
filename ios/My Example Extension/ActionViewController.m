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

@property(strong,nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ActionViewController

- (void)loadView {
  NSURL *jsCodeLocation;
  
  jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];
  
  NSDictionary *initialProps = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool: TRUE] forKey:@"isActionExtension"];

  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"ReactNativeExampleBrowserExtension"
                                               initialProperties:initialProps
                                                   launchOptions:nil];
  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
  self.view = rootView;
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    // Get the item[s] we're handling from the extension context.
//    
//    // For example, look for an image and place it into an image view.
//    // Replace this with something appropriate for the type[s] your extension supports.
//    BOOL imageFound = NO;
//    for (NSExtensionItem *item in self.extensionContext.inputItems) {
//        for (NSItemProvider *itemProvider in item.attachments) {
//            if ([itemProvider hasItemConformingToTypeIdentifier:(NSString *)kUTTypeImage]) {
//                // This is an image. We'll load it, then place it in our image view.
//                __weak UIImageView *imageView = self.imageView;
//                [itemProvider loadItemForTypeIdentifier:(NSString *)kUTTypeImage options:nil completionHandler:^(UIImage *image, NSError *error) {
//                    if(image) {
//                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                            [imageView setImage:image];
//                        }];
//                    }
//                }];
//                
//                imageFound = YES;
//                break;
//            }
//        }
//        
//        if (imageFound) {
//            // We only handle one image, so stop looking for more.
//            break;
//        }
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done {
    // Return any edited content to the host app.
    // This template doesn't do anything, so we just echo the passed in items.
    [self.extensionContext completeRequestReturningItems:self.extensionContext.inputItems completionHandler:nil];
}

@end
