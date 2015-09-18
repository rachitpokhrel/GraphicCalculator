//
//  GCMathParser.m
//  GraphicCalculator
//
//  Created by Rachit on 9/18/15.
//  Copyright (c) 2015 Rachit. All rights reserved.
//

#import "GCMathParser.h"

@implementation GCMathParser

-(NSNumber *)evaluateExpression:(NSString *)string atInterval:(NSNumber*)xValue
{
    int y = pow([xValue intValue], 3);
    return [NSNumber numberWithInt:y];
}

@end
