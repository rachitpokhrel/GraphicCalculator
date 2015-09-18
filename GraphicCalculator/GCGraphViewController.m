//
//  ViewController.m
//  GraphicCalculator
//
//  Created by Rachit on 9/18/15.
//  Copyright (c) 2015 Rachit. All rights reserved.
//

#import "GCGraphViewController.h"
#import "GCGraph.h"


@interface GCGraphViewController ()

@end

@implementation GCGraphViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GCGraph *graph = [[GCGraph alloc] initWithFrame:self.view.frame expression:self.expression];
    [self.view addSubview:graph];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
