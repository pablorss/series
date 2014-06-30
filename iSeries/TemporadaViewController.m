//
//  TemporadaViewController.m
//  iSeries
//
//  Created by Pablo Robles Sánchez on 03/11/13.
//  Copyright (c) 2013 Pablo Robles Sánchez. All rights reserved.
//

#import "TemporadaViewController.h"

@interface TemporadaViewController ()

@end

@implementation TemporadaViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        //self.title = NSLocalizedString(@"Temporada", @"Temporada");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Set title for view
    self.title = NSLocalizedString(@"Temporada", @"Temporada");
}

-(void)setDetailObject:(PFObject *)currentDetailObject
{
    if (_detailObject != currentDetailObject) {
        _detailObject = currentDetailObject;
        
        // Update the view.
        [self configureView];
    }
}

-(void)configureView
{
    // Update the user interface for the detail item.
    NSString *tituloSerie = [[NSString alloc] initWithString: [self.detailObject objectForKey:@"Titulo"]];
    PFQuery *queryTemporadas = [PFQuery queryWithClassName:@"Temporada"];
    [queryTemporadas whereKey:@"Serie" equalTo:tituloSerie];
    self.arregloTemp = [[NSMutableArray alloc] initWithArray:[queryTemporadas findObjects]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.arregloTemp.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    PFObject *currentTemporada = [self.arregloTemp objectAtIndex:indexPath.row];
    cell.textLabel.text = [currentTemporada objectForKey:@"NumTemporada"];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    CapitulosViewController *detailViewController = [[CapitulosViewController alloc] initWithNibName:@"CapitulosViewController" bundle:nil];

    // Pass the selected object to the new view controller.
    PFObject *object = [self.arregloTemp objectAtIndex:[indexPath row]];
    [detailViewController setDetailObject:object];
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
