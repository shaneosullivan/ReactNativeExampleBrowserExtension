#import "ActionExtension.h"
#import "ActionViewController.h"

@implementation ActionExtension

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(done) {
  [actionViewController done];
}

RCT_EXPORT_METHOD(rnViewLoaded:(RCTResponseSenderBlock)callback) {
  NSDictionary* props =[actionViewController getUpdatedProps];
  callback(@[[NSNull null], props]);
}

@end
