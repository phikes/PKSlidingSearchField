//
// Created by Phillip Kessels on 26.05.13.
// Copyright (c) 2013 phikes mobile&desktop. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PKSlidingSearchField.h"

@implementation PKSlidingSearchField {}

- (void)awakeFromNib
{
    _isAnimating = NO;
    _visible = NO;
}

- (void)cancelOperation:(id)sender
{
    //slide out
    [self toggle];

    //give focus away
    [self.window makeFirstResponder:self.view];
}

- (IBAction)toggle
{
    //prevent the user from fucking up the animation
    if(_isAnimating) return;
    _isAnimating = YES;

    CGRect searchFieldFrame = self.frame;
    CGRect viewFrame = self.view.frame;

    if(_visible)
    {
        //slide out
        searchFieldFrame.origin.y = viewFrame.size.height + searchFieldFrame.size.height;
        viewFrame.size.height += searchFieldFrame.size.height;

        _visible = NO;
    }
    else
    {
        //slide in
        searchFieldFrame.origin.y = viewFrame.size.height - searchFieldFrame.size.height;
        viewFrame.size.height -= searchFieldFrame.size.height;

        //give focus
        [self.window makeFirstResponder:self];

        _visible = YES;
    }

    //animate
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:.05];

    [[self animator] setFrame: searchFieldFrame];
    [[self.view animator] setFrame:viewFrame];

    [NSAnimationContext endGrouping];
    _isAnimating = NO;
}


@end