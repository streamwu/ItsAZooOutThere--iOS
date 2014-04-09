//
//  ViewController.h
//  ItsAZooOutThere
//
//  Created by StreamWu on 1/31/14.
//  Copyright (c) 2014 Stream Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *animalLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *animalScrollView;
@property (nonatomic,strong) NSMutableArray *animals;

@end
