//
//  UIScrollViewDelegate.h
//  ItsAZooOutThere
//
//  Created by StreamWu on 2/2/14.
//  Copyright (c) 2014 Stream Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UIScrollViewDelegate <NSObject>
@required
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
@end
