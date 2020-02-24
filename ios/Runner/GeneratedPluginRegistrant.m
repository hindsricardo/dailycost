//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<cloud_functions/CloudFunctionsPlugin.h>)
#import <cloud_functions/CloudFunctionsPlugin.h>
#else
@import cloud_functions;
#endif

#if __has_include(<firebase_core/FLTFirebaseCorePlugin.h>)
#import <firebase_core/FLTFirebaseCorePlugin.h>
#else
@import firebase_core;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [CloudFunctionsPlugin registerWithRegistrar:[registry registrarForPlugin:@"CloudFunctionsPlugin"]];
  [FLTFirebaseCorePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseCorePlugin"]];
}

@end
