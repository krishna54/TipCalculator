//
//  TipViewController.m
//  TipCalculator
//
//  Created by tkrishna on 6/5/14.
//  Copyright (c) 2014 tkrishna. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *BillTextField;
@property (weak, nonatomic) IBOutlet UILabel *TipLabel;
@property (weak, nonatomic) IBOutlet UILabel *TotalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *TipControl;
- (IBAction)OnTap:(id)sender;
- (void)updateValues;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValues];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.BillTextField.text floatValue];
    
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    float tipAmount = billAmount * [tipValues[self.TipControl.selectedSegmentIndex] floatValue];
    float totalAmount = tipAmount + billAmount;
    self.TipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.TotalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}
@end
