//
//  Animal.m
//  ItsAZooOutThere
//
//  Created by StreamWu on 1/31/14.
//  Copyright (c) 2014 Stream Wu. All rights reserved.
//

#import "Animal.h"

@implementation Animal

- (NSString *) description{
    return [NSString stringWithFormat: @"Animal Object: name = %@, age = %@, image = %@", [self name], [self age], [self image]];
}

@end
