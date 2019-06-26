//
//  ViewController.m
//  Tip Calculator
//
//  Created by lucjia on 6/25/19.
//  Copyright © 2019 lucjia. All rights reserved.
//

#import "ViewController.h"
#import "SettingsViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UITextField *otherTipField;

@end

@implementation ViewController

double tipPercentage = 0;
double bill = 0;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSInteger selectedSegment = 0;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double doubleValue = [defaults doubleForKey:@"default_tip_percentage"];
    
    if (doubleValue == 15) {
        selectedSegment = 0;
    } else if (doubleValue == 18) {
        selectedSegment = 1;
    } else if (doubleValue == 20) {
        selectedSegment = 2;
    } else {
        selectedSegment = 3;
    }
    
    NSArray *percentages = @[@(0.15), @(0.18), @(0.2)];
    
    if (self.tipControl.selectedSegmentIndex < 3) {
        doubleValue = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    } else {
        SettingsViewController *vc = [[SettingsViewController alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
    NSLog(@"View will appear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    bill = [self.billField.text doubleValue];
    
    NSArray *percentages = @[@(0.15), @(0.18), @(0.2), @(0)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

- (IBAction)onEditingBegin:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.tipLabel.alpha = 0.5;
        self.totalLabel.alpha = 0.5;
        self.tipControl.alpha = 0.5;
    }];
}

- (IBAction)onEditingEnd:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.tipLabel.alpha = 1;
        self.totalLabel.alpha = 1;
        self.tipControl.alpha = 1;
    }];
}

- (IBAction)onEditingEndTip:(id)sender {
    double tipPercentage = [self.otherTipField.text doubleValue];
    
    double tip = tipPercentage / 100 * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}
@end
