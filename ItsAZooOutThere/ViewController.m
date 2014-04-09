//
//  ViewController.m
//  ItsAZooOutThere
//
//  Created by StreamWu on 1/31/14.
//  Copyright (c) 2014 Stream Wu. All rights reserved.
//

#import "ViewController.h"
#import "Animal.h"
#import "NSArray+Shuffle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    Animal *mouse = [[Animal alloc] init];
    mouse.name = @"Mickey Mouse";
    mouse.age = @86;
    mouse.image = [UIImage imageNamed:@"Mickey Mouse.jpg"];
    
    Animal *duck = [[Animal alloc] init];
    duck.name = @"Donald Duck";
    duck.age = @80;
    duck.image = [UIImage imageNamed:@"Donald Duck.jpg"];
    
    Animal *bear = [[Animal alloc] init];
    bear.name = @"Winnies Bear";
    bear.age = @89;
    bear.image = [UIImage imageNamed:@"Winnie Bear.jpg"];
    
    _animals = [[NSMutableArray alloc] initWithCapacity:3];
    [self.animals setObject:mouse atIndexedSubscript:0];
    [self.animals setObject:duck atIndexedSubscript:1];
    [self.animals setObject:bear atIndexedSubscript:2];
    
    _animals = [NSMutableArray arrayWithArray:[_animals shuffle]];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self loadScrollView];
}

-(void)loadScrollView{
    int numberOfAnimals = [self.animals count];
    
    self.animalScrollView.contentSize = CGSizeMake(numberOfAnimals * self.animalScrollView.frame.size.width, self.animalScrollView.frame.size.height);
    
    //Add buttons
    UIButton *button;
    UIImageView *imageView;
    for(int i = 0; i < numberOfAnimals; i++){
        button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(320*i+80, 25, 160, 40);
        button.backgroundColor = [UIColor lightGrayColor];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.tag = i;
        
        Animal *currentAnimal = [self.animals objectAtIndex:i];
        [button setTitle: currentAnimal.name forState: UIControlStateNormal];
        [button addTarget:self action:@selector(buttonTapped:)
         forControlEvents:UIControlEventTouchUpInside];
        [self.animalScrollView addSubview:button];
        
        //Add image
        imageView = [[UIImageView alloc] initWithImage:currentAnimal.image];
        imageView.frame = CGRectMake(320*i, 200, 320, 170);
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.animalScrollView addSubview:imageView];
        
        //set label text if first loaded
        if(i == 0){
            self.animalLabel.text = currentAnimal.name;
        }
        
    }
    
}

-(void)buttonTapped:(UIButton*)sender{
    Animal *currentAnimal = [self.animals objectAtIndex:sender.tag];
    NSLog(@"%@", [currentAnimal description]);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //Calculate current page
    NSInteger previousPage = 0;
    NSInteger currentPage = 0;
    CGFloat pageWidth = scrollView.frame.size.width;
    float fractionalPage = scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    if (previousPage != page) {
        previousPage = currentPage;
        currentPage = page;
    }
    
    Animal *currentAnimal = [self.animals objectAtIndex:currentPage];
    self.animalLabel.text = currentAnimal.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
