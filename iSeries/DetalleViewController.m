//
//  DetalleViewController.m
//  iSeries
//
//  Created by Pablo Robles Sánchez on 03/11/13.
//  Copyright (c) 2013 Pablo Robles Sánchez. All rights reserved.
//

#import "DetalleViewController.h"
#import <Parse/Parse.h>

@interface DetalleViewController ()

@end

@implementation DetalleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.capitulo.text = [self.detailObject objectForKey:@"Titulo"];
    
    NSString *temporadaID = [self.detailObject objectForKey:@"Temporada"];
    PFQuery *querySerie = [PFQuery queryWithClassName:@"Temporada"];
    [querySerie whereKey:@"objectId" equalTo:temporadaID];
    NSMutableArray *serie = [[NSMutableArray alloc] initWithArray:[querySerie findObjects]];
    PFObject *nombreSerie = [serie objectAtIndex:0];
    NSString *serieText = [nombreSerie objectForKey:@"Serie"];
    self.serie.text = serieText;
    
    PFQuery *queryImage = [PFQuery queryWithClassName:@"Series"];
    [queryImage whereKey:@"Titulo" equalTo:serieText];
    NSMutableArray *imagenArray = [[NSMutableArray alloc] initWithArray:[queryImage findObjects]];
    PFObject *imagenObject = [imagenArray objectAtIndex:0];
    PFFile *file = [imagenObject objectForKey:@"Imagen"];
    [file getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error){
        UIImage *imageFile = [UIImage imageWithData:imageData];
        [self.imagen setImage:imageFile];
    }];
    
    
    NSDate *fecha = [self.detailObject objectForKey:@"Aired"];
    NSDateFormatter *formato = [[NSDateFormatter alloc] init];
    [formato setDateFormat:@"dd-MMMM-yyyy"];
    self.fecha.text = [formato stringFromDate:fecha];
    
    self.sinopsis.text = [self.detailObject objectForKey:@"Sinopsis"];
    NSString *visto = [NSString stringWithFormat:@"%@",[self.detailObject objectForKey:@"Visto"]];
    UIImage *yes = [UIImage imageNamed:@"yes.png"];
    UIImage *no = [UIImage imageNamed:@"no.png"];
    if([visto isEqualToString:@"1"]){
        self.variable = YES;
        self.visto.text = @"Ya vi este episodio";
        [self.boton setBackgroundImage:yes forState:UIControlStateNormal];
    }
    else{
        self.variable = NO;
        self.visto.text = @"No he visto este episodio";
        [self.boton setBackgroundImage:no forState:UIControlStateNormal];
        
    }
    
}


- (void)cambiarStatus
{
    UIImage *yes = [UIImage imageNamed:@"yes.png"];
    UIImage *no = [UIImage imageNamed:@"no.png"];
    if(self.variable){
        self.visto.text = @"Ya vi este episodio";
        [self.boton setBackgroundImage:yes forState:UIControlStateNormal];

    }
    else{
        self.visto.text = @"No he visto este episodio";
        [self.boton setBackgroundImage:no forState:UIControlStateNormal];

    }
}

- (void)setDetailObject:(PFObject *)currentDetailObject
{
    if (_detailObject != currentDetailObject) {
        _detailObject = currentDetailObject;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)botonVisto:(id)sender {

    if(self.variable){
        PFQuery *query = [PFQuery queryWithClassName:@"Episodios"];
        NSString *objectId = [self.detailObject objectId];
        [query getObjectInBackgroundWithId:objectId block:^(PFObject *episodio, NSError *error) {
            episodio[@"Visto"] = @NO;
            [episodio saveInBackground];
        }];
        self.variable = NO;
    }
    else{
        PFQuery *query = [PFQuery queryWithClassName:@"Episodios"];
        NSString *objectId = [self.detailObject objectId];
        [query getObjectInBackgroundWithId:objectId block:^(PFObject *episodio, NSError *error) {
            episodio[@"Visto"] = @YES;
            [episodio saveInBackground];
        }];
        self.variable = YES;

    }
    [self cambiarStatus];
}
@end
