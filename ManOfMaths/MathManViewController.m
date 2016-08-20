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
@property (weak, nonatomic) IBOutlet UILabel *mathNameLabel;
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
- (IBAction)setDefaultLabelText:(UIButton *)sender {
     //_mathNameLabel.text = @"Default Text";
}

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
    //_mathNameLabel.text = textField.text ;
    [self checkValidMealName ];
    self.navigationItem.title = self.nameTextField.text;
    
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // if ([[segue identifier] isEqualToString:@"YOUR_SEGUE_NAME_HERE"])
    NSString * name = _nameTextField.text;
    NSUInteger * year = 1923;
    UIImage *  photo = _photoImagView.image;
    // Set the manMath to be passed to ManMathTableViewController after the unwind segue.
    self.man = [[MathMan alloc] initWithName: name photo: @"Turing" andYear: year];
    
    
    
}

- (IBAction)cancel:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

@end