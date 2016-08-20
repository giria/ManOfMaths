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


- (instancetype) initWithName: (NSString*) name photoImage: (UIImage *) image andYear: (NSUInteger) year {
    if (!(self = [super init]))
        return nil;
    self.name = name;
    self.picture = image;
    self.yearOfBirth = year;
    
    return self;
}


- (id)initWithCoder:(NSCoder *)decoder {
  if (self = [super init]) {
  
     self.name = [decoder decodeObjectForKey:@"name"];
     self.picture = [decoder decodeObjectForKey:@"picture"];
     self.yearOfBirth = [[decoder decodeObjectForKey:@"yearOfBirth"] intValue];
  
  }
    // Initialization should fail if there is no name
    // TODO
    
    return self;

}


- (void)encodeWithCoder:(NSCoder *)encoder {

  [encoder encodeObject: _name forKey:@"name"];
  [encoder encodeObject: _picture forKey:@"picture"];
  [encoder encodeObject: @(_yearOfBirth) forKey:@"yearOfBirth"];
 

}

#pragma mark - Archiving Paths


@end




