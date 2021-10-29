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
- (bool)boot: (VZVirtualMachine *)vm
{
    // Credits to KhaosT
    // https://twitter.com/KhaosT/status/1452841752419659776
    // https://gist.github.com/KhaosT/8167170d1452daec1ba292e37e5768c8
    
    NSLog(@"Booting in Recovery Mode");
    
    __block bool ret = false;
    
    id start_options = [[NSClassFromString(@"_VZVirtualMachineStartOptions") alloc] init];
    [start_options setValue: @YES forKey: @"bootMacOSRecovery"];
    
    id completion = ^(NSError *error) {
        if (error == nil) {
            NSLog(@"Success");
            ret = true;
        }
        else {
            NSLog(@"Error while starting VM in Recovery Mode");
        }
    };
    
    [vm performSelector: @selector(_startWithOptions:completionHandler:)
             withObject: start_options
             withObject: completion];
    
    return ret;
}

@end
