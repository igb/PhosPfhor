//
//  ViewController.m
//  PhosPhfor
//
//  Created by Ian Brown on 4/16/17.
//  Copyright © 2017 Ian Brown. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

    @property (nonatomic, retain) IBOutlet UIImageView *flickrImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://c1.staticflickr.com/3/2811/33810153212_f0b5710193_b_d.jpg"]]];
    
    
    [_flickrImage setImage:image];

    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
