//
//  Animal.h
//  ItsAZooOutThere
//
//  Created by StreamWu on 1/31/14.
//  Copyright (c) 2014 Stream Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject

@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSNumber *age;
@property (strong,nonatomic) UIImage *image;


- (NSString *) description;

@end
