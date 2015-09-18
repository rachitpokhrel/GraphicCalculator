//
//  GCExpressionViewController.m
//  GraphicCalculator
//
//  Created by Rachit on 9/18/15.
//  Copyright (c) 2015 Rachit. All rights reserved.
//

#import "GCExpressionViewController.h"
#import "GCGraphViewController.h"

@interface GCExpressionViewController ()

@end

@implementation GCExpressionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    GCGraphViewController *controller = [segue destinationViewController];
    controller.expression = self.expressionTextField.text;
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
