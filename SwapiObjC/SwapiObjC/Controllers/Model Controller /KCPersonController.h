//
//  KCPersonController.h
//  SwapiObjC
//
//  Created by Kaleb  Carrizoza on 10/1/20.
//

#import <Foundation/Foundation.h>
@class KCPerson;


NS_ASSUME_NONNULL_BEGIN

@interface KCPersonController : NSObject

+(void)fetchPersonArray:(void(^)(NSArray <KCPerson*>*, NSError *error)) completion;

@end

NS_ASSUME_NONNULL_END
