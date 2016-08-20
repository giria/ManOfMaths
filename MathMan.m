//
//  MathMan.m
//  ManOfMaths
//
//  Created by Joan Barrull Ribalta on 19/08/16.
//  Copyright © 2016 com.giria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MathMan.h"

@implementation MathMan : NSObject 

- (instancetype) initWithName: (NSString*) name photo: (NSString *) photoName andYear: (NSUInteger) year {
    if (!(self = [super init]))
        return nil;
    self.name = name;
    self.picture = [UIImage imageNamed: photoName];
    self.yearOfBirth = year;
    
    return self;
}

@end




