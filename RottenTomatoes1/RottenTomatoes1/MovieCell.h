//
//  MovieCell.h
//  RottenTomatoes1
//
//  Created by tkrishna on 6/9/14.
//  Copyright (c) 2014 tkrishna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterview;

@end
