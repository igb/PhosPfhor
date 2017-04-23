//
//  FlickrPhoto.h
//  PhosPhfor
//
//  Created by Ian Brown on 4/18/17.
//  Copyright © 2017 Ian Brown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrPhoto : NSObject {
    NSString* photo_id;
    NSString* secret;
    NSString* server;
    NSString* farm;
    
}

- (NSString*)toUrl;
- (void)setPhotoId:(NSString*)aPhotoId;
- (void)setSecret:(NSString*)aSecret;
- (void)setServer:(NSString*)aServer;
- (void)setFarm:(NSString*)aFarm;

@end
