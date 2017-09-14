#import "ActionExtension.h"
#import "ActionViewController.h"

@implementation ActionExtension

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(done) {
  [actionViewController done];
}

RCT_EXPORT_METHOD(fetchDomainUrl:(RCTResponseSenderBlock)callback) {
  NSString* url = [actionViewController getDomainUrl];
  callback(@[[NSNull null], url]);
}

@end
