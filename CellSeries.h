//
//  CellSeries.h
//  iSeries
//
//  Created by Pablo Robles Sánchez on 25/11/13.
//  Copyright (c) 2013 Pablo Robles Sánchez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface CellSeries : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *etiqueta;
- (IBAction)oprimioFav:(id)sender;
@property (strong, nonatomic) NSString *serie;

@end
