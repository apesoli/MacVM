//
//  private.h
//  MacVM
//
//  Created by alfredo on Dec 11, 2021.
//

#ifndef private_h
#define private_h

#import <Foundation/Foundation.h>
#import <Virtualization/Virtualization.h>

//
// bootMacOSRecovery
// https://twitter.com/KhaosT/status/1452841752419659776
// https://gist.github.com/KhaosT/8167170d1452daec1ba292e37e5768c8

@interface _VZVirtualMachineStartOptions : NSObject

@property (readwrite) BOOL stopInIBootStage1;
@property (readwrite) BOOL stopInIBootStage2;
@property (readwrite) BOOL bootMacOSRecovery;
@property (readwrite) BOOL forceDFU;

@end

@interface VZVirtualMachine()

- (void)_startWithOptions: (_VZVirtualMachineStartOptions *_Nonnull)options
        completionHandler: (void (^_Nonnull)(NSError * _Nullable errorOrNil))completionHandler;

@end

//
// NOTE: com.apple.private.virtualization is needed for this
// https://github.com/NyanSatan/Virtual-iBoot-Fun
@interface _VZGDBDebugStubConfiguration : NSObject <NSCopying>

- (id _Nullable)initWithPort: (unsigned short)port;
- (id _Nullable)makeDebugStubForVirtualMachine: (id _Nonnull)arg1;
- (bool)listensOnAllNetworkInterfaces;
- (void)setListensOnAllNetworkInterfaces: (bool)arg1;

@end

@interface VZVirtualMachineConfiguration()

- (void)_setDebugStub: (_VZGDBDebugStubConfiguration *_Nonnull)config;

@end

@interface _VZPL011SerialPortConfiguration : VZSerialPortConfiguration

- (instancetype _Nonnull)init;

@end

#endif /* private_h */
