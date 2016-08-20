//
//  MathManViewController.m
//  ManOfMaths
//
//  Created by Joan Barrull Ribalta on 18/08/16.
//  Copyright © 2016 com.giria. All rights reserved.
//

#import "MathManViewController.h"


@interface MathManViewController ()
#pragma mark - Properties
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UITextField *yearOfBirth;

@property (weak, nonatomic) IBOutlet UIImageView *photoImagView;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;


@end

@implementation MathManViewController

/*
 This value is either passed by `MealTableViewController` in `prepareForSegue(_:sender:)`
 or constructed as part of adding a new meal.
 */






- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _nameTextField.delegate = self;
    _yearOfBirth.delegate = self;
    
    if ( self.man != nil ) {
        self.navigationItem.title = self.man.name;
        _nameTextField.text = self.man.name;
        _yearOfBirth.text = [NSString stringWithFormat:@"%lu",  (unsigned long)self.man.yearOfBirth];          ;
        _photoImagView.image = self.man.picture;
        // TODO set birthdate
        
        
    }
    
    
    
    // Enable the Save button only if the text field has a valid name.
    [self checkValidMealName ];
}
- (IBAction)saveButton:(UIBarButtonItem *)sender {
    
    
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    // Dismiss the picker if the user canceled.
    [self dismissViewControllerAnimated:TRUE completion:nil ];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    // The info dictionary contains multiple representations of the image, and this uses the original.
    UIImage * selectedImage = info[UIImagePickerControllerOriginalImage];
    // Set photoImageView to display the selected image.
    _photoImagView.image = selectedImage;
    // Dismiss the picker.
    [picker dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Actions
 

- (IBAction)selectImageFromPhotoLibrary:(UITapGestureRecognizer *)sender {
    // Hide the keyboard.
   [ _nameTextField resignFirstResponder ];
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    // Only allow photos to be picked, not taken.
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    // Make sure ViewController is notified when the user picks an image.
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:NULL];
    
}



#pragma mark - TextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder ];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    // Disable the Save button while editing.
    [self.saveButton setEnabled:FALSE];
}

- (void) checkValidMealName {
  // Disable the Save button if the text field is empty.
 //   NSString * text = (self.nameTextField.text != nil) ? self.nameTextField.text : "";
    NSString * text = self.nameTextField.text ;
    self.saveButton.enabled = !([text length] == 0 );

}

- (void)textFieldDidEndEditing:(UITextField *)textField {
   
    [self checkValidMealName ];
    self.navigationItem.title = self.nameTextField.text;
    
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // if ([[segue identifier] isEqualToString:@"YOUR_SEGUE_NAME_HERE"])
    NSString * name = _nameTextField.text;
    NSUInteger * year = [_yearOfBirth.text integerValue];
    UIImage *  photo = _photoImagView.image;
    // Set the manMath to be passed to ManMathTableViewController after the unwind segue.
   // self.man = [[MathMan alloc] initWithName: name photo: @"Turing" andYear: year];
    self.man = [[MathMan alloc] initWithName: name photoImage: _photoImagView.image andYear: year];
   
    
    
}

- (IBAction)cancel:(UIBarButtonItem *)sender {
    // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
    
    UINavigationController*  isPresentingInAddMathManMode =  (UINavigationController *) self.presentingViewController ;
    if (isPresentingInAddMathManMode) {
    
        [self dismissViewControllerAnimated:TRUE completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:TRUE ];
    }
}

@end
