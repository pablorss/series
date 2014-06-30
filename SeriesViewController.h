//
//  SeriesViewController.h
//  iSeries
//
//  Created by Pablo Robles Sánchez on 03/11/13.
//  Copyright (c) 2013 Pablo Robles Sánchez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TemporadaViewController.h"
#import <Parse/Parse.h>
#import "CellSeries.h"

@interface SeriesViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *arregloSeries;
@end
