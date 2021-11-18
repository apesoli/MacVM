//
//  recovery.m
//  MacVM
//
//  Created by alfredo on 28/10/21.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#import "recovery.h"

@implementation Recovery

//
// This accepts a VZVirtualMachine instance in order to call on the private API
// and boot in recovery mode
//
- (void)boot: (VZVirtualMachine *)vm completion: (void (^)(NSError *err))completion_handler;
{
    // Credits to KhaosT
    // https://twitter.com/KhaosT/status/1452841752419659776
    // https://gist.github.com/KhaosT/8167170d1452daec1ba292e37e5768c8
    
    NSLog(@"Booting in Recovery Mode");
    
    id start_options = [[NSClassFromString(@"_VZVirtualMachineStartOptions") alloc] init];
    [start_options setValue: @YES forKey: @"bootMacOSRecovery"];
    
    [vm performSelector: @selector(_startWithOptions:completionHandler:)
             withObject: start_options
             withObject: completion_handler];
}

@end
