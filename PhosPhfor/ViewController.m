//
//  ViewController.m
//  PhosPhfor
//
//  Created by Ian Brown on 4/16/17.
//  Copyright © 2017 Ian Brown. All rights reserved.
//

#import "ViewController.h"
#import "FlickrParser.h"
#import "FlickrPhoto.h"


@interface ViewController ()

    @property IBOutlet UIImageView *flickrImage;

@end

@implementation ViewController

- (UIImageView*)getImageView {
    return _flickrImage;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSString* aahnaUrl = @"https://c1.staticflickr.com/3/2811/33810153212_f0b5710193_b_d.jpg";
    NSString* otherUrl = @"https://c1.staticflickr.com/8/7185/26985497980_1d8c7d0ed8_b_d.jpg";
    
    
    UIImage *aahnaImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:aahnaUrl]]];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:otherUrl]]];
    
    
   // [[self flickrImage]  setImage:image];

    NSLog(@"img1  %@", [self flickrImage]);
    
   // [NSThread sleepForTimeInterval:10.0f];
    
   // [[self flickrImage]  setImage:aahnaImage];


    

    FlickrParser *flickrParser = [[FlickrParser alloc] init];
    
    NSURL *url = [[NSURL alloc]initWithString:@"https://api.flickr.com/services/rest/?method=flickr.photosets.getPhotos&api_key=94f66fb2062c5f140446c76ac999d897&photoset_id=72157668555903631&user_id=20721230%40N00&format=rest"];
    NSXMLParser *parser = [[NSXMLParser alloc]initWithContentsOfURL:url];
    [parser setDelegate:flickrParser];
    BOOL result = [parser parse];
    
    images = [flickrParser getPhotos];
    
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    count = 0;
    NSLog(@"slideshow...");
    //[self playSlideshow];
    timer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(updatePhoto) userInfo:nil repeats:YES];
    

    
}

- (void) updatePhoto {
       
    
    count = (count + 1)  % [images count];
    FlickrPhoto* photo = [images objectAtIndex:count];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[photo toUrl]]]];
    
    NSLog(@"updating photo...%zd/%zd", count, [images count]);
    
    [[self flickrImage]  setImage:image];
   
    
}

- (void) playSlideshow {
    
    int i;
    for (i = 0; i < [images count]; i++) {
        FlickrPhoto* photo = [images objectAtIndex:i];
        NSString* photoUrl = [photo toUrl];
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:photoUrl]]];
        
       // NSLog(@"img2  %@", [self flickrImage]);
        
        self.flickrImage.image = nil;
        
        [self.flickrImage setNeedsDisplay];
        
    
       // NSLog(@"new iamge...%@", photoUrl);
        [NSThread sleepForTimeInterval:10.0f];
        
        
        
        
    }

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
