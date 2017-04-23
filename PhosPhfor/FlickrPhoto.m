//
//  FlickrPhoto.m
//  PhosPhfor
//
//  Created by Ian Brown on 4/18/17.
//  Copyright © 2017 Ian Brown. All rights reserved.
//

#import "FlickrPhoto.h"

@implementation FlickrPhoto

- (NSString*)toUrl {
    return [NSString stringWithFormat:@"https://c1.staticflickr.com/%@/%@/%@_%@_b_d.jpg", farm, server, photo_id, secret];
}

- (void)setPhotoId:(NSString*)aPhotoId {
    photo_id = aPhotoId;
}
- (void)setSecret:(NSString*)aSecret {
    secret = aSecret;
}
- (void)setServer:(NSString*)aServer {
    server = aServer;
}
- (void)setFarm:(NSString*)aFarm {
    farm = aFarm;
}


@end
