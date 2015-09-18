//
//  GCGraph.m
//  GraphicCalculator
//
//  Created by Rachit on 9/18/15.
//  Copyright (c) 2015 Rachit. All rights reserved.
//

#import "GCGraph.h"
#import "AxesDrawer.h"
#import "GCMathParser.h"

@interface GCGraph()
@property (nonatomic, strong) NSString *expression;
@end

@implementation GCGraph

-(instancetype)initWithFrame:(CGRect)frame expression:(NSString*)expression
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context); // Previous Code
    CGPoint point = CGPointMake(rect.size.width/2, rect.size.height/2);
    [AxesDrawer drawAxesInRect:rect originAtPoint:point scale:1.0];
    //plot
    [self plotExpression:self.expression inRect:rect context:context unitSize:10 lineWidth:3.0];
    
    CGContextRestoreGState(context);
}


-(void)plotExpression:(NSString *)expression inRect:(CGRect)rect context:(CGContextRef)context unitSize:(int)unit lineWidth:(CGFloat)line
{
    GCMathParser *parser = [[GCMathParser alloc] init];
    CGMutablePathRef graphPath = CGPathCreateMutable();
    
    
    for (int i = -rect.size.width; i < rect.size.width; i = i+ unit)
    {
        CGPoint point;
        point.x = i;
        point.y = [[parser evaluateExpression:expression atInterval:[NSNumber numberWithInt:point.x]] intValue];
        CGAffineTransform transform = CGAffineTransformIdentity;
        transform = CGAffineTransformMakeTranslation(rect.size.width/2, rect.size.height/2);
        transform = CGAffineTransformScale(transform, 1, -1);
        int mY = [[parser evaluateExpression:expression atInterval:[NSNumber numberWithInt:i - unit]] intValue];
        CGPathMoveToPoint(graphPath, &transform, i - unit, mY);
        CGPathAddLineToPoint(graphPath, &transform, point.x, point.y);
    }
    
    CGPathCloseSubpath(graphPath);
    CGContextAddPath(context, graphPath);
    CGContextSetStrokeColorWithColor(context,[UIColor blackColor].CGColor);
    CGContextSetLineWidth(context, line);
    CGContextStrokePath(context);
    
    // Cleanup Code
    CGPathRelease(graphPath);
}

@end
