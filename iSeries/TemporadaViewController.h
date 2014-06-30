//
//  TemporadaViewController.h
//  iSeries
//
//  Created by Pablo Robles Sánchez on 03/11/13.
//  Copyright (c) 2013 Pablo Robles Sánchez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CapitulosViewController.h"

@interface TemporadaViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *arregloTemp;
@property (nonatomic, retain) PFObject *detailObject;

@end
