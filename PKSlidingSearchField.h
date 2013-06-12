//
// Created by Phillip Kessels on 26.05.13.
// Copyright (c) 2013 phikes mobile&desktop. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface PKSlidingSearchField : NSSearchField
{
    BOOL _isAnimating;
    BOOL _visible;
}

@property (nonatomic, weak) IBOutlet NSView* view;

- (IBAction)toggle;

@end