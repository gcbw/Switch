//
//  SWRoundedRectView.m
//  Switch
//
//  Created by Scott Perry on 03/01/13.
//  Copyright © 2013 Scott Perry.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "SWRoundedRectView.h"


@implementation SWRoundedRectView

#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame;
{
    BailUnless(self = [super initWithFrame:frame], nil);
    
    [self setWantsLayer:YES];
    
    return self;
}

#pragma mark - NSView

- (void)updateLayer;
{
    if (self.border > 0) {
        self.layer.borderWidth = self.border;
        self.layer.borderColor = [[[NSColor whiteColor] colorWithAlphaComponent:1.0] CGColor];
		self.layer.cornerRadius = self.radius;
		self.layer.backgroundColor = [[[NSColor blackColor] colorWithAlphaComponent:0.75] CGColor];
    }else{
        self.border = self.layer.borderWidth = 5;
        self.layer.borderColor = [[[NSColor yellowColor] colorWithAlphaComponent:1.0] CGColor];
		self.layer.cornerRadius = self.radius;
		self.layer.backgroundColor = [[[NSColor blackColor] colorWithAlphaComponent:1.0] CGColor];
	}
}

@end
