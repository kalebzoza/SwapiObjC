//
//  KCPerson.m
//  SwapiObjC
//
//  Created by Kaleb  Carrizoza on 10/1/20.
//

#import "KCPerson.h"

@implementation KCPerson

- (instancetype)initWithName:(NSString *)name gender:(NSString *)gender height:(NSInteger)height
{
    self = [super init];
    if (self)
    {
        _name = name;
        _gender = gender;
        _height = height;
    }
    return self;
}
@end

@implementation KCPerson (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[@"name"];
    NSString *gender = dictionary[@"gender"];
    NSInteger height = [dictionary[@"height"]integerValue];
    
    return [self initWithName:name gender:gender height:height];
}

@end
