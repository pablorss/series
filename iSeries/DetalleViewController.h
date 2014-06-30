//
//  DetalleViewController.h
//  iSeries
//
//  Created by Pablo Robles Sánchez on 03/11/13.
//  Copyright (c) 2013 Pablo Robles Sánchez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface DetalleViewController : UIViewController

@property (nonatomic, retain) PFObject *detailObject;
@property (weak, nonatomic) IBOutlet UILabel *serie;
@property (weak, nonatomic) IBOutlet UILabel *capitulo;
@property (weak, nonatomic) IBOutlet UILabel *fecha;
@property (weak, nonatomic) IBOutlet UITextView *sinopsis;
@property (weak, nonatomic) IBOutlet UILabel *visto;
@property (weak, nonatomic) IBOutlet UIButton *boton;
@property (weak, nonatomic) IBOutlet PFImageView *imagen;
@property bool variable;
- (IBAction)botonVisto:(id)sender;

@end
