//
//  SettingsViewController.m
//  Tip Calculator
//
//  Created by lucjia on 6/25/19.
//  Copyright © 2019 lucjia. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *defaultTipField;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onEditDefault:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:[self.defaultTipField.text doubleValue] forKey:@"default_tip_percentage"];
    [defaults synchronize];
}

@end
