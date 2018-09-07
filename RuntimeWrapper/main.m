#import "NSObject+RuntimeWrapper.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%@", [NSObject methods]);
    }
    
    return 0;
}
