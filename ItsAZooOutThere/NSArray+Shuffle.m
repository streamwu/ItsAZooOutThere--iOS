//
//  NSArray+Shuffle.m
//  ItsAZooOutThere
//
//  Created by StreamWu on 1/31/14.
//  Copyright (c) 2014 Stream Wu. All rights reserved.
//

#import "NSArray+Shuffle.h"

@implementation NSArray (Shuffle)

- (NSArray *)shuffle{
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (id anObject in self) {
        NSUInteger randomPos = arc4random()%([tmpArray count]+1);
        [tmpArray insertObject:anObject atIndex:randomPos];
    }
    return [NSArray arrayWithArray:tmpArray];
}

@end
