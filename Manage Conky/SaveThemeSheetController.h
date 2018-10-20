//
//  SaveThemeSheetController.h
//  Manage Conky
//
//  Created by Nickolas Pylarinos on 22/07/2018.
//  Copyright © 2018 Nickolas Pylarinos. All rights reserved.
//

#import "MCObjects/MCObjects.h"
#import "SaveWidgetSheetController.h"

@interface SaveThemeSheetController : GeneralSheetController<NSTableViewDelegate, NSTableViewDataSource, SaveWidgetSheetControllerDelegate>
{
    /* table */
    NSInteger selectedView;
    NSMutableArray *fromListWidgets;
    NSMutableArray *fromDirectoryWidgets;
    NSMutableArray *searchDirectories;
}

@property NSString *name;
@property NSString *preview;
@property NSString *wallpaper;
@property NSMutableArray<NSString *> *conkyConfigs;
@property NSString *source;
@property NSString *creator;
@property MCWallpaperScaling scaling;

@property BOOL relative;    /* keep wallpaper path relative or not? */

@property (weak) IBOutlet NSTextField *themeNameField;
@property (weak) IBOutlet NSTextField *themeCreatorField;
@property (weak) IBOutlet NSTextField *themeSourceField;
@property (weak) IBOutlet NSPopUpButton *scalingPopUpButton;
@property (weak) IBOutlet NSTextField *wallpaperPathLabel;

@property (weak) IBOutlet NSTableView *wt;
@property (weak) IBOutlet NSTableView *widgetsTableView;

@end
