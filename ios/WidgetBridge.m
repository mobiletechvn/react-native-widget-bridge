#import <React/RCTBridgeModule.h>
// #import "React/RCTEventEmitter.h"

//@interface RCT_EXTERN_MODULE(WidgetBridge, RCTEventEmitter)
@interface RCT_EXTERN_MODULE(WidgetBridge, NSObject)

RCT_EXTERN_METHOD(
                  multiply:(float)a withB:(float)b
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject
                  )

RCT_EXTERN_METHOD(
                  initUserDefaultsSuit: (NSString *)suiteName
                  withResolver: (RCTPromiseResolveBlock)resolve
                  withRejecter: (RCTPromiseRejectBlock)reject
                  )

RCT_EXTERN_METHOD(
                  ensureUserDefaultsSuit: (NSString *)suiteName_
                  withResolver: (RCTPromiseResolveBlock)resolve
                  withRejecter: (RCTPromiseRejectBlock)reject
                  )


RCT_EXTERN_METHOD(
                  setDict: (NSString *)key withValue:(NSDictionary *)value
                  withResolver: (RCTPromiseResolveBlock)resolve
                  withRejecter: (RCTPromiseRejectBlock)reject
                  )

RCT_EXTERN_METHOD(
                  getDict: (NSString *)key
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject
                  )

RCT_EXTERN_METHOD(
                  reloadWidget: (NSString *)kind
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject
                  )

@end
