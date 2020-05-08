//
//  SidebarViewController.m
//  SidebarDemo
//
//  Created by Simon on 29/6/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "SidebarViewController.h"
#import "SWRevealViewController.h"
//#import "PhotoViewController.h"

@interface SidebarViewController ()

//@property (nonatomic, strong) NSArray *menuItems;
@end

@implementation SidebarViewController{
    NSArray   *menuID ;
    NSArray *menuNames;
    NSArray *menuIcons;
     
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    menuID = @[@"divideConta", @"sobre", @"ajuda",@"noAnuncio"];
    menuIcons = [NSArray arrayWithObjects:
                [UIImage imageNamed:@"restaurant.png"],
                [UIImage imageNamed:@"sobre.png"],
                 [UIImage imageNamed:@"ajuda.png"],
                 [UIImage imageNamed:@"noAnuncio.png"],
                        nil];
    
    menuNames = @[NSLocalizedString(@"Men_div", nil),
                 NSLocalizedString(@"Men_sob", nil),
                  NSLocalizedString(@"Men_aju", nil),
                  NSLocalizedString(@"Men_no_Anuncio", nil)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//titulo da table
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
//    NSString *sectionName;
//    switch (section)
//    {
//        case 0:
//            sectionName = NSLocalizedString(@"mySectionName", @"mySectionName");
//            break;
//        case 1:
//            sectionName = NSLocalizedString(@"myOtherSectionName", @"myOtherSectionName");
//            break;
//            // ...
//        default:
//            sectionName = @"";
//            break;
//    }
    return NSLocalizedString(@"Men_tit", nil);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return menuID.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = [menuID objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    
    
    
//    cell.imageView.image = [[UIImage imageNamed:@"ajuda.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    cell.imageView.image = [menuIcons objectAtIndex:indexPath.row];
//    
    cell.textLabel.text = [menuNames objectAtIndex:indexPath.row];
    return cell;
}


#pragma mark - Navigation

//// In a storyboard-based application, you will often want to do a little preparation before navigation
////- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//
//    // Set the title of navigation bar by using the menu items
//    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
////    destViewController.title = [[menuItems objectAtIndex:indexPath.row] capitalizedString];
//    
//    
//    }



@end
