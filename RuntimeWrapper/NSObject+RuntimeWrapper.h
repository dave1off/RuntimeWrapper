#import <Foundation/Foundation.h>

@interface NSObject (RuntimeWrapper)

+ (NSArray *)properties;
+ (NSMutableArray *)methods;
+ (size_t)instanceSize;
+ (NSArray *)conformingProtocols;

@end
