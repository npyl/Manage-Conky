//
//  AppController.m
//  Manage Conky
//
//  Created by Nickolas Pylarinos on 09/09/2017.
//  Copyright © 2017 Nickolas Pylarinos. All rights reserved.
//

#import "MCObjects/MCObjects.h"
#import "GeneralSheetController.h"

@implementation GeneralSheetController

- (id)initWithWindowNibName:(NSString *)nibName andMode:(NSUInteger)mode
{
    self = [super initWithWindowNibName:nibName];
    self.mode = mode;
    return self;
}

- (void)loadOnWindow:(NSWindow *)_targetWindow
{
    self.targetWindow = _targetWindow;
    [_targetWindow beginSheet:self.window completionHandler:^(NSModalResponse returnCode) {
        [_targetWindow endSheet:self.window];
    }];

    [[MCSettings sharedSettings] pushWindow:self.window];
}

- (IBAction)close:(id)sender
{
    [self.window close];
    
    [[MCSettings sharedSettings] popWindow];
}

@end
