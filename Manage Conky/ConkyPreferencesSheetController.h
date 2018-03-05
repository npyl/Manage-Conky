//
//  ConkyPreferencesSheetController.h
//  Manage Conky
//
//  Created by Nickolas Pylarinos on 09/09/2017.
//  Copyright © 2017 Nickolas Pylarinos. All rights reserved.
//

#import "GeneralSheetController.h"
#import "ConkyInstallerSheetController.h"

@interface ConkyPreferencesSheetController : GeneralSheetController<NSTextFieldDelegate>    // ##: Check me
{
    ConkyInstallerSheetController *ctl;
    BOOL conkyXInstalled;
    BOOL conkyAgentPresent;
}

@property (weak) IBOutlet NSButton *runConkyAtStartupCheckbox;
@property (weak) IBOutlet NSButton *un_in_stallConkyButton;
@property (weak) IBOutlet NSTextField *conkyConfigLocationTextfield;

- (IBAction)activatePreferencesSheet:(id)sender;

@end
