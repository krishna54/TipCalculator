//
//  MovieDetailViewController.m
//  RottenTomatoes1
//
//  Created by tkrishna on 6/9/14.
//  Copyright (c) 2014 tkrishna. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface MovieDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *posterview;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsislabel;

@end

@implementation MovieDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *posterUrl = [NSURL URLWithString:[self.movie valueForKeyPath:@"posters.original"]];
    
    [self.posterview setImageWithURL:posterUrl];
    
    self.titlelabel.text = self.movie[@"title"];
    
    self.synopsislabel.text = self.movie[@"synopsis"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
