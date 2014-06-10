//
//  MoviesViewController.m
//  RottenTomatoes1
//
//  Created by tkrishna on 6/9/14.
//  Copyright (c) 2014 tkrishna. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieDetailViewController.h"
#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"


@interface MoviesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) NSArray *movies;
@end

@implementation MoviesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Movies";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    NSString *url;
    
    if ([self.movieType isEqualToString:@"In Theaters"]) {
        url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=dkamefha4fn4j79mcm4ygwtk";
    } else {
        url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=dkamefha4fn4j79mcm4ygwtk";
    }

    
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@", object);
        self.movies = object[@"movies"];
        [self.tableview reloadData];
        
    }];
    [self.tableview registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellReuseIdentifier:@"MovieCell"];
    self.tableview.rowHeight = 150;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View methods

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section  {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell for row at index path: %d", indexPath.row);
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    
    NSDictionary *movie = self.movies[indexPath.row];
    
    cell.movieTitleLabel.text = movie[@"title"];
    cell.synopsisLabel.text = movie[@"synopsis"];
    
    NSURL *posterUrl = [NSURL URLWithString:[movie valueForKeyPath:@"posters.detailed"]];
    [cell.posterview setImageWithURL:posterUrl];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *movie = self.movies[indexPath.row];
    
    MovieDetailViewController *vc = [[MovieDetailViewController alloc] init];
    vc.movie = movie;
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
