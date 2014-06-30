//
//  CellSeries.m
//  iSeries
//
//  Created by Pablo Robles Sánchez on 25/11/13.
//  Copyright (c) 2013 Pablo Robles Sánchez. All rights reserved.
//

#import "CellSeries.h"

@implementation CellSeries

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)oprimioFav:(id)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"Series"];
    [query whereKey:@"Titulo" equalTo:self.serie ];
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:[query findObjects]];
    PFObject *object = [array objectAtIndex:0];
    [object setObject:[NSNumber numberWithBool:YES] forKey:@"Favorita"];
    [object save];
    
}
@end
