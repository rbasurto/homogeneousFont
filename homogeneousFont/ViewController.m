//
//  ViewController.m
//  homogeneousFont
//
//  Created by Rene Alejandro Basurto Quijada on 27/04/14.
//  Copyright (c) 2014 Rene A Basurto Q. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setup];
}

- (void)setup
{
    self.view.backgroundColor = [UIColor grayColor];
    
    NSArray *texts;
    texts = [NSArray arrayWithObjects: @"Monday", @"December",
             @"Hello World", @"One", @"Television", @"Walt Disney",
             @"The Three Musketeers", @"Yes", @"No", @"Click", nil];
    
    NSMutableArray *views = [[NSMutableArray alloc] init];
    
    CGFloat x = self.view.frame.size.width / 4;
    CGFloat width = self.view.frame.size.width / 2;
    CGFloat height = 30.0;
    CGFloat heightOfLabel = 15;
    
    
    UIFont *theFont = [self homogeneousFontFor:texts
                                          rect:CGRectMake(0.0, 0.0, width, heightOfLabel)
                                      fontName:[NSString stringWithFormat:@"HelveticaNeue"]];
    
    
    for (int i = 0; i < [texts count]; i++) {
        CGFloat y = (height + 10) * (i + 1);
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, height)];
        view.backgroundColor = [UIColor whiteColor];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, view.frame.size.width, heightOfLabel)];
        
        [label setBackgroundColor:[UIColor lightGrayColor]];
        [label setOpaque:NO];
        [label setCenter:(CGPointMake)(view.frame.size.width/2,view.frame.size.height/2)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = (NSString *)[texts objectAtIndex:i];
        label.font = theFont;
        
        [view addSubview:label];
        [views addObject:view];
        [self.view addSubview:view];
    }
    
    
}

- (UIFont *)homogeneousFontFor:(NSArray *)arrayOfTexts
                          rect:(CGRect)rect
                      fontName:(NSString *)fontName
{
    CGFloat minSizeOfFont = 500.0;
    CGFloat tempSize = 12.0;
    CGFloat proportion = 1;
    CGRect tempRect;
    
    for (NSString *text in arrayOfTexts) {
        NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:fontName size:tempSize]};
        tempRect.size = [text sizeWithAttributes:attributes];
        
        proportion = rect.size.width / tempRect.size.width;
        tempSize *= proportion;
        
        if (tempSize < minSizeOfFont) minSizeOfFont = tempSize;
    }
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:fontName size:minSizeOfFont]};
    tempRect.size = [arrayOfTexts[0] sizeWithAttributes:attributes];
    
    if (tempRect.size.height > rect.size.height) {
        proportion = rect.size.height / tempRect.size.height;
        minSizeOfFont *= proportion;
    }

    return [UIFont fontWithName:fontName size:minSizeOfFont];
}



@end
