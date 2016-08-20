//
//  MathManTableViewController.m
//  ManOfMaths
//
//  Created by Joan Barrull Ribalta on 19/08/16.
//  Copyright © 2016 com.giria. All rights reserved.
//

#import "MathManTableViewController.h"
#import "MathMan.h"
#import "MathManTableViewCell.h"
#import "MathManViewController.h" 



@interface MathManTableViewController ()

 @property NSMutableArray* men;

@end

@implementation MathManTableViewController {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.men = [NSMutableArray array];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    // [self loadSampleMathMen];
    
    // Load any saved men, otherwise load sample data.
    
    NSMutableArray * savedMen = [self loadArchivedMen];
    if (savedMen != nil) {
        self.men = savedMen ;
    } else {
        [self loadSampleMathMen];
    }
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void) loadSampleMathMen {
    
    MathMan* turing = [[MathMan alloc]initWithName:@"Alan Turing" photo:@"Turing" andYear:1920 ];
    
    MathMan* newton = [[MathMan alloc]initWithName:@"Isaac Newton" photo:@"Newton" andYear:1710 ];
     MathMan* vonNeumann = [[MathMan alloc]initWithName:@"John von Neumann" photo:@"vonNeumann" andYear:1927 ];
    
    
    
    [self.men addObject:turing];
    [self.men addObject:newton];
    [self.men addObject:vonNeumann];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.men count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * cellIdentifier = @"MathManTableViewCell";
    MathManTableViewCell  *cell =
    (MathManTableViewCell*) [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
     // Fetches the appropriate man for the data source layout.
    MathMan * mathMan = (MathMan *) [self.men objectAtIndex: indexPath.row];
    
    
    // Configure the cell...
    cell.nameLabel.text = [mathMan name];
    cell.photo.image = mathMan.picture;
   
    cell.yearOfBirthLabel.text = [@(mathMan.yearOfBirth) stringValue];
    return cell;
}






// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.men removeObjectAtIndex:indexPath.row ];
        [self saveMen];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowDetail"]) {
          MathManViewController * mathManViewController =
        (MathManViewController * ) segue.destinationViewController;
        // Get the cell that generated this segue
        MathManTableViewCell * selectedMathManCell = ( MathManTableViewCell *) sender;
        NSIndexPath* indexPath = [self.tableView indexPathForCell:selectedMathManCell];
        MathMan * selectedMathMan = self.men[indexPath.row];
        mathManViewController.man = selectedMathMan;
    
    }else if ([[segue identifier] isEqualToString:@"AddItem"]) {
        NSLog(@" Adding new MathMan");
    }
}



-(IBAction)prepareForUnwind:(UIStoryboardSegue *)unwindSegue {
    
    
    
    
    UIViewController* sourceViewController = unwindSegue.sourceViewController;
    
    NSIndexPath* selectedIndexPath =    [self.tableView indexPathForSelectedRow];
    if (selectedIndexPath) {
        // user is editing an existing cell
        MathMan * man = ((MathManViewController*) sourceViewController).man;
        self.men[selectedIndexPath.row] = man;
        [self.tableView reloadRowsAtIndexPaths:@[selectedIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else {
        // Add a new meal
        MathMan* man = ((MathManViewController *) sourceViewController).man ;
        // MathMan * man = [[ MathMan alloc] initWithName:@"Wiles" photo: @"Wiles" andYear:1925];
        NSIndexPath * newIndexPath = [ NSIndexPath indexPathForRow: self.men.count inSection: 0];
        [self.men addObject: man];
        [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation: UITableViewRowAnimationFade ];
        
        
    }
    // Save men to disk
    [self saveMen];
    

        
    }

#pragma mark - NScoding
- (void ) saveMen {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject: self.men ];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"men"];
    
}

- (NSMutableArray * ) loadArchivedMen {
    
    NSData *menArrayData = [[NSUserDefaults standardUserDefaults] objectForKey:@"men"];
    NSMutableArray * menArray = [NSKeyedUnarchiver unarchiveObjectWithData:menArrayData];
    return menArray;
}

    



@end
