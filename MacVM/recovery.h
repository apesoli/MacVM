#import <Foundation/Foundation.h>
#import <Virtualization/Virtualization.h>


@interface Recovery : NSObject

- (void)boot: (VZVirtualMachine * _Nonnull)vm completion: (void (^_Nonnull)(NSError * _Nullable err))completion_handler;

@end

/*
@interface _VZVirtualMachineStartOptions

@property (readwrite) BOOL bootMacOSRecovery;

@end
*/
@interface VZVirtualMachine()

- (void)_startWithOptions:(_Nonnull id) options
        completionHandler:(void (^_Nonnull)(NSError * _Nullable errorOrNil))completionHandler;

@end
/*
@interface VZMacAuxiliaryStorage ()

- (nullable NSDictionary<NSString *, NSString *> *)_allNVRAMVariablesWithError:(NSError *__autoreleasing  _Nullable *)error;

- (nullable NSString *)_valueForNVRAMVariableNamed:(NSString *)name
                                             error:(NSError *__autoreleasing  _Nullable *)error;

- (BOOL)_setValue:(NSString *)value forNVRAMVariableNamed:(NSString *)name
            error:(NSError *__autoreleasing  _Nullable *)error;

@end
*/
