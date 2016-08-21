//
//  MathManTableViewController.h
//  ManOfMaths
//
//  Created by Joan Barrull Ribalta on 19/08/16.
//  Copyright © 2016 com.giria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MathManTableViewController : UITableViewController

@property (nonatomic, strong) UISearchController * searchController;
@property (nonatomic, strong) NSMutableArray * allItems;
@property (nonatomic, strong) NSMutableArray * filteredItems;
@property (nonatomic, strong) NSMutableArray * displayedItems;


@end
