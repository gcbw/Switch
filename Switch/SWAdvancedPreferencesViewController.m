//
//  SWAdvancedPreferencesViewController.m
//  Switch
//
//  Created by Scott Perry on 04/30/14.
//  Copyright © 2014 Scott Perry.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "SWAdvancedPreferencesViewController.h"

#import "SWPreferencesService.h"


@interface SWAdvancedPreferencesViewController ()

@property (nonatomic, weak) IBOutlet NSButton *multimonBox;
@property (nonatomic, weak) IBOutlet NSButton *groupByMonBox;
@property (nonatomic, weak) IBOutlet NSButton *statusItemBox;

@end


@implementation SWAdvancedPreferencesViewController

- (void)viewWillAppear;
{
    NSButton *multimonBox = self.multimonBox;
    multimonBox.state = [SWPreferencesService sharedService].multimonInterface ? NSOnState : NSOffState;
    
    NSButton *groupByMonBox = self.groupByMonBox;
    groupByMonBox.state = [SWPreferencesService sharedService].multimonGroupByMonitor ? NSOnState : NSOffState;

    NSButton *statusItemBox = self.statusItemBox;
    statusItemBox.state = [SWPreferencesService sharedService].showStatusItem ? NSOnState : NSOffState;

    [self updateInterface];
}

#pragma mark - MASPreferencesViewController

- (NSString *)identifier
{
    return NSStringFromClass([self class]);
}

- (NSImage *)toolbarItemImage
{
    return [NSImage imageNamed:NSImageNameAdvanced];
}

- (NSString *)toolbarItemLabel
{
    return NSLocalizedString(@"Advanced", @"Toolbar item name for the Advanced preference pane");
}

- (BOOL)hasResizableWidth;
{
    return NO;
}

- (BOOL)hasResizableHeight;
{
    return NO;
}

#pragma mark - IBAction

- (IBAction)multimonChanged:(NSButton *)sender;
{
    [SWPreferencesService sharedService].multimonInterface = (sender.state == NSOnState);
    [self updateInterface];
}

- (void)updateInterface;
{
    NSButton *multimonBox = self.multimonBox;
    NSButton *groupByMonBox = self.groupByMonBox;

    groupByMonBox.enabled = (multimonBox.state == NSOnState);
    groupByMonBox.state = (multimonBox.state == NSOnState && [SWPreferencesService sharedService].multimonGroupByMonitor) ? NSOnState : NSOffState;
}

- (IBAction)groupByMonChanged:(NSButton *)sender;
{
    [SWPreferencesService sharedService].multimonGroupByMonitor = (sender.state == NSOnState);
}

- (IBAction)statusItemChanged:(NSButton *)sender;
{
    [SWPreferencesService sharedService].showStatusItem = (sender.state == NSOnState);
}

@end
