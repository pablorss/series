//
//  SeriesViewController.m
//  iSeries
//
//  Created by Pablo Robles Sánchez on 03/11/13.
//  Copyright (c) 2013 Pablo Robles Sánchez. All rights reserved.
//

#import "SeriesViewController.h"
#import <Parse/Parse.h>

@interface SeriesViewController ()

@end

@implementation SeriesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //Obtain the information about the Series
    self.title = NSLocalizedString(@"iSeries", @"iSeries");
    PFQuery *querySeries = [PFQuery queryWithClassName:@"Series"];
    self.arregloSeries =  [[NSMutableArray alloc] initWithArray:[querySeries findObjects]];
    
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
    return self.arregloSeries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"celdaCustom";
    CellSeries *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CellSeries alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    PFObject *currentSerie = [self.arregloSeries objectAtIndex:indexPath.row];
    //cell.textLabel.text = [currentSerie objectForKey:@"Titulo"];
    cell.etiqueta.text = [currentSerie objectForKey:@"Titulo"];
    cell.serie = [currentSerie objectForKey:@"Titulo"];
    return cell;
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    TemporadaViewController *detailViewController = [[TemporadaViewController alloc] initWithNibName:@"TemporadaViewController" bundle:nil];

    // Pass the selected object to the new view controller.
    PFObject *object = [self.arregloSeries objectAtIndex:[indexPath row]];
    [detailViewController setDetailObject:object];
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}

@end
