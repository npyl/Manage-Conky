//
//  ViewController.h
//  Manage Conky
//
//  Created by Nickolas Pylarinos on 08/09/2017.
//  Copyright © 2017 Nickolas Pylarinos. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MCConfigEditor.h"
#import "MCObjects.h"
#import <unistd.h>

typedef enum {
    widgetsThemesTableShowWidgets,
    widgetsThemesTableShowThemes,
} MCWidgetThemesTableShow;

@interface ViewController : NSViewController<NSTableViewDelegate, NSTableViewDataSource>
{
    MCWidgetThemesTableShow whatToShow;
    NSMutableArray<MCTheme*> *themesArray;
    NSMutableArray<MCWidget*> *widgetsArray;
    
    NSPopover *previewPopover;
    
    MCConfigEditor *editorController;
    NSPopover *editorPopover;
}

@property (weak) IBOutlet NSImageView *themeOrWidgetPreviewImage;
@property (weak) IBOutlet NSTableView *widgetsThemesTable;

/**
 * Function used to fill widgetsArray and themesArray
 * Also used by ThemesSheet by getting the pointer to the ViewController instance
 *  to fill the table after loading a themepack.
 */
- (void)fillWidgetsThemesArrays;
- (void)emptyWidgetsThemesArrays;

@end
