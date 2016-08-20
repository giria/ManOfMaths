//
//  MathMan.h
//  ManOfMaths
//
//  Created by Joan Barrull Ribalta on 19/08/16.
//  Copyright © 2016 com.giria. All rights reserved.
//

//#import <UIKit.h>

@interface MathMan : NSObject {
    // protected instance variables (not recomennded )
}

@property (copy) NSString* name;
@property  UIImage* picture;
@property NSUInteger yearOfBirth;

- (instancetype) initWithName: (NSString*) name photo: (NSString *) photoName andYear: (NSUInteger) year;


@end


