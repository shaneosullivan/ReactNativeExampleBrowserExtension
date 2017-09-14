//
//  ActionViewController.h
//  My Example Extension
//
//  Created by Shane O'Sullivan on 06/09/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTRootView.h>

@interface ActionViewController : UIViewController

@property (nonatomic, strong) RCTRootView *reactView;
@property (nonatomic, strong) NSString *domainUrl;

- (void) done;
- (NSString*) getDomainUrl;

extern ActionViewController * actionViewController;

@end
