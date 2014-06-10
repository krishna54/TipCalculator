//
//  MoviesCell.h
//  RottenTomatoes
//
//  Created by tkrishna on 6/8/14.
//  Copyright (c) 2014 tkrishna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoviesCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UIImageView *Posterview;

@end
