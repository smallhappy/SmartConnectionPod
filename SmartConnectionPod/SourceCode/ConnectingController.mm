#import "ConnectingController.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import <CoreFoundation/CoreFoundation.h>
#import "elian.h"

@interface ConnectingController ()

@end

@implementation ConnectingController

static bool _smartConnecting = NO;

void *context;

- (void)connectHandlerWithSSID:(NSString*)ssid andPassword:(NSString*)password andCustomInfo:(NSString*)customInfo {
    NSLog(@"㊙️ ssid: %@, password: %@, customInfo: %@", ssid, password, customInfo);
    
    if (_smartConnecting) {
        NSLog(@"SmartConnection is running");
        _smartConnecting = NO;
        return;
    }
    
    _smartConnecting = YES;
        
    if (![self isArgExist:ssid] || ![self isArgExist:password] || ![self isArgExist:customInfo]) {
        NSLog(@"Data not complete");
        _smartConnecting = NO;
        return;
    }
    
    unsigned char target[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
    int retValue = ELIAN_ERROR_CODE_OK;
    
    context = elianNew(nil, 0, target, 1);
    if (nil == context) {
        NSLog(@"LoadLib Failed");
        _smartConnecting = NO;
        return;
    }
    
    const char *SSID = [ssid UTF8String];
    retValue = elianPut(context, TYPE_ID_SSID, (char *)SSID, (int)strlen(SSID));
    if (ELIAN_ERROR_CODE_OK != retValue) {
        elianDestroy(context);
        _smartConnecting = NO;
        return;
    }
    
    const char *PASSWORD = [password UTF8String];
    retValue = elianPut(context, TYPE_ID_PWD, (char *)PASSWORD, (int)strlen(PASSWORD));
    if (ELIAN_ERROR_CODE_OK != retValue) {
        elianDestroy(context);
        _smartConnecting = NO;
        return;
    }
    
    const char *CUSTOMINFO = [customInfo UTF8String];
    retValue = elianPut(context, TYPE_ID_CUST, (char *)CUSTOMINFO, (int)strlen(CUSTOMINFO));
    if (ELIAN_ERROR_CODE_OK != retValue) {
        elianDestroy(context);
        _smartConnecting = NO;
        return;
    }
    
    retValue = elianStart(context);

    _smartConnecting = NO;
}

- (BOOL)isArgExist:(NSString*)arg {
    return arg != nil && ![arg isEqualToString:@""];
}

@end
