//
//  TextStatsViewController.m
//  Attributor
//
//  Created by ly on 15/11/12.
//  Copyright © 2015年 princeli. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController()
@property (weak, nonatomic) IBOutlet UILabel *colorfulCharactersLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedCharactersLabel;

@end

@implementation TextStatsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.textToAnalyze = [[NSAttributedString alloc] initWithString:@"test" attributes:@{NSForegroundColorAttributeName:[UIColor greenColor] , NSStrokeWidthAttributeName:@-3}];
}

- (void)setTextToAnalyze:(NSAttributedString *)textToAnalyze
{
    _textToAnalyze = textToAnalyze;
    if(self.view.window)[self updateUI ];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self updateUI];
}

- (void)updateUI
{
    self.colorfulCharactersLabel.text = [NSString stringWithFormat:@"%lu colorful charaters",[[self charactersWithAttribute: NSForegroundColorAttributeName] length]];
    self.outlinedCharactersLabel.text = [NSString stringWithFormat:@"%lu outlined charaters",[[self charactersWithAttribute: NSStrokeWidthAttributeName] length]];
}

- (NSAttributedString *)charactersWithAttribute:(NSString *) attributeName
{
    NSMutableAttributedString * characters = [[NSMutableAttributedString alloc]init];
    
    NSUInteger index = 0;
    while (index < [self.textToAnalyze length]) {
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if (value) {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
        } else{
            index++;
        }
    }
    
    return characters;
}



@end
