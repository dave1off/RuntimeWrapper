#import "NSObject+RuntimeWrapper.h"
#import "objc/runtime.h"

@implementation NSObject (RuntimeWrapper)

+(NSArray *)properties {
    unsigned int count;
    
    objc_property_t *properties = class_copyPropertyList(self, &count);
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < count; i++) {
        const char *name = property_getAttributes(properties[i]);
        
        [result addObject:[NSString stringWithCString:name encoding:NSUTF8StringEncoding]];
    }
    
    return result;
}

+(NSArray *)methods {
    unsigned int count;
    
    Method *methods = class_copyMethodList(self, &count);
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < count; i++) {
        struct objc_method_description *data = method_getDescription(methods[i]);
        
        [result addObject:NSStringFromSelector(data->name)];
    }
    
    return result;
}

+ (size_t)instanceSize {
    return class_getInstanceSize(self);
}

+ (NSArray *)conformingProtocols {
    unsigned int count;
    
    Protocol * __unsafe_unretained * list = class_copyProtocolList(self, &count);
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < count; i++) {
        [result addObject:[NSString stringWithCString:protocol_getName(list[i]) encoding:NSUTF8StringEncoding]];
    }
    
    return result;
}



@end
