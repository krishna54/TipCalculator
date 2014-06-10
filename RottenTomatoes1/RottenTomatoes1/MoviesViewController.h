//
//  MoviesViewController.h
//  RottenTomatoes1
//
//  Created by tkrishna on 6/9/14.
//  Copyright (c) 2014 tkrishna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoviesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSString *movieType;

@end
