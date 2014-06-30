//
//  CapitulosViewController.h
//  iSeries
//
//  Created by Pablo Robles Sánchez on 03/11/13.
//  Copyright (c) 2013 Pablo Robles Sánchez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetalleViewController.h"
#import <Parse/Parse.h>

@interface CapitulosViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *arregloCaps;
@property (nonatomic, retain) PFObject *detailObject;

@end
