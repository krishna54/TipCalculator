//
//  MoviesViewController.m
//  RottenTomatoes
//
//  Created by tkrishna on 6/8/14.
//  Copyright (c) 2014 tkrishna. All rights reserved.
//

#import "MoviesViewController.h"
#import "MoviesCell.h"


@interface MoviesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *TableView;
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
    
    self.TableView.delegate = self;
    self.TableView.dataSource = self;
    
    NSString *url;
    
   //if ([self.movieType isEqualToString:@"Box Office"]) {
//      url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=dkamefha4fn4j79mcm4ygwtk"#;
// else {
//       url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=dkamefha4fn4j79mcm4ygwtk"#;
//}
    
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@", object);
        
        self.movies = object[@"movies"];
        [self.TableView reloadData];
        
    }];
    
    [self.TableView registerNib:[UINib nibWithNibName:@"MoviesCell" bundle:nil] forCellReuseIdentifier:@"MoviesCell"];
     self.TableView.rowHeight = 150;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View methods

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell for row at index path: %d",indexPath.row);
    
    MoviesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MoviesCell"];
    
    NSDictionary *movie = self.movies[indexPath.row];
    
    cell.movieTitleLabel.text = movie[@"title"];
    cell.synopsisLabel.text = movie[@"synopsis"];
    
    //NSURL *posterUrl = [NSURL URLWithString:[movie valueForKeyPath:@"posters.detailed"]];
    //[cell.posterView setImageWithURL:posterUrl];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *movie = self.movies[indexPath.row];
    
    //MovieDetailsViewController *vc = [[MovieDetailsViewController alloc] init];
   // vc.movie = movie;
    
    //[self.navigationController pushViewController:vc animated:YES];
}

@end
