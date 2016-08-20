//
//  MathManViewController.h
//  ManOfMaths
//
//  Created by Joan Barrull Ribalta on 18/08/16.
//  Copyright © 2016 com.giria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MathMan.h" 

@interface MathManViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property MathMan* man ;
@end

