#import <Foundation/Foundation.h>

@interface ConnectingController : NSObject

- (void)connectHandlerWithSSID:(NSString*)ssid andPassword:(NSString*)password andCustomInfo:(NSString*)customInfo;

@end
