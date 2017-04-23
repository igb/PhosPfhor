//
//  FlickrParser.m
//  PhosPhfor
//
//  Created by Ian Brown on 4/16/17.
//  Copyright © 2017 Ian Brown. All rights reserved.
//

#import "FlickrParser.h"
#import "FlickrPhoto.h"

@implementation FlickrParser {
    NSMutableArray* images;
    BOOL isPhoto;
}

-(NSArray*)getPhotos {
    return images;
}


- (id)init {
    images = [[NSMutableArray alloc] init];
    return self;
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"Did start element");
    
    NSLog(@"found %@", elementName);

    
    if ( [elementName isEqualToString:@"photo"])
    {
        isPhoto = true;
        FlickrPhoto* photo = [[FlickrPhoto alloc] init];
        [photo setPhotoId:[attributeDict valueForKey:@"id"]];
        [photo setFarm:[attributeDict valueForKey:@"farm"]];
        [photo setServer:[attributeDict valueForKey:@"server"]];
        [photo setSecret:[attributeDict valueForKey:@"secret"]];
        [photo setPhotoId:[attributeDict valueForKey:@"id"]];
        
        [images addObject:photo];
        
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"Did end element");
    if ([elementName isEqualToString:@"photo"])
    {
        NSLog(@"end photo");
        isPhoto = false;
    }
    
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSString *tagName = @"column";
    
    if([tagName isEqualToString:@"column"])
    {
        NSLog(@"Value %@",string);
    }
    
}

@end
