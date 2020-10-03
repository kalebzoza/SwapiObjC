//
//  KCPersonController.m
//  SwapiObjC
//
//  Created by Kaleb  Carrizoza on 10/1/20.
//

#import "KCPersonController.h"
#import "KCPerson.h"
//https://swapi.dev/api/people

static NSString * const baseURLString = @"https://swapi.dev/api";
static NSString * const peopleEndpoint = @"people";

@implementation KCPersonController

+ (void)fetchPersonArray:(void (^)(NSArray<KCPerson *> * _Nullable, NSError *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *finalURL = [baseURL URLByAppendingPathComponent:peopleEndpoint];
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"There was an error; %@, %@", error, error.localizedDescription);
            return completion(nil, error);
        }
        
        if (!data)
        {
            NSLog(@"There was no data found");
            completion(nil,error);
            return;
        }
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSArray *resultsArray = topLevelDictionary[@"results"];
                NSMutableArray *peopleArray = [NSMutableArray array];
                for (NSDictionary *resultsDictionary in resultsArray)
                {
                    KCPerson *person = [[KCPerson alloc] initWithDictionary:resultsDictionary];
                    [peopleArray addObject:person];
                }
               return completion(peopleArray,nil);
        
    }]resume];
}

@end
