//
//  ViewController.m
//  SelfSizingCells
//
//  Created by Samuel Goodwin on 2/13/15.
//  Copyright (c) 2015 Roundwall Software. All rights reserved.
//

#import "ViewController.h"

@interface Item : NSObject
@property (nonatomic, copy) NSString *text;
@end

@implementation Item
@end

@interface ItemCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

- (void)setItem:(Item *)item;
@end

@implementation ItemCell
- (void)setItem:(Item *)item
{
    self.titleLabel.text = item.text;
}

@end

@interface ViewController ()
@property (nonatomic, copy) NSArray *items;
@property (nonatomic, assign) BOOL shouldReload;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self reload];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fontSizeChanged) name:UIContentSizeCategoryDidChangeNotification object:nil];
}

- (void)fontSizeChanged
{
    [self.tableView reloadData];
}

- (IBAction)reload
{
    Item *shortOne = [[Item alloc] init];
    shortOne.text = @"This is a short line.";
    
    Item *longOne = [[Item alloc] init];
    longOne.text = @"This is a much longer one. I might decide to give my whole fucking life story in this one. You watch out, I'll be the famous person one day.";
    
    Item *mediumOne = [[Item alloc] init];
    mediumOne.text = @"This is longer than a short one but not an essay.";
    
    Item *superLongOne = [[Item alloc] init];
    superLongOne.text = @"Do you see any Teletubbies in here? Do you see a slender plastic tag clipped to my shirt with my name printed on it? Do you see a little Asian child with a blank expression on his face sitting outside on a mechanical helicopter that shakes when you put quarters in it? No? Well, that's what you see at a toy store. And you must think you're in a toy store, because you're here shopping for an infant named Jeb.";
    
    Item *reallyLong = [[Item alloc] init];
    reallyLong.text = @"Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends.\n\nNormally, both your asses would be dead as fucking fried chicken, but you happen to pull this shit while I'm in a transitional period so I don't wanna kill you, I wanna help you. But I can't give you this case, it don't belong to me. Besides, I've already been through too much shit this morning over this case to hand it over to your dumb ass.\n\nThe path of the righteous man is beset on all sides by the iniquities of the selfish and the tyranny of evil men. Blessed is he who, in the name of charity and good will, shepherds the weak through the valley of darkness, for he is truly his brother's keeper and the finder of lost children. And I will strike down upon thee with great vengeance and furious anger those who would attempt to poison and destroy My brothers. And you will know My name is the Lord when I lay My vengeance upon thee.";
    
    Item *shorter = [[Item alloc] init];
    shorter.text = @"Poopin";
    
    Item *oneLine = [[Item alloc] init];
    oneLine.text = @"This should be like one line.";
    
    self.items = [[NSSet setWithArray:@[shortOne, longOne, mediumOne, superLongOne, shorter, reallyLong, oneLine]] allObjects];
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Item *item = self.items[indexPath.row];
    
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [cell setItem:item];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

@end
