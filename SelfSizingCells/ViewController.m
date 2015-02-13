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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Item *shortOne = [[Item alloc] init];
    shortOne.text = @"This is a short line.";
    
    Item *longOne = [[Item alloc] init];
    longOne.text = @"This is a much longer one. I might decide to give my whole fucking life story in this one. You watch out, I'll be the famous person one day.";
    
    Item *mediumOne = [[Item alloc] init];
    mediumOne.text = @"This is longer than a short one but not an essay.";
    
    Item *superLongOne = [[Item alloc] init];
    superLongOne.text = @"Do you see any Teletubbies in here? Do you see a slender plastic tag clipped to my shirt with my name printed on it? Do you see a little Asian child with a blank expression on his face sitting outside on a mechanical helicopter that shakes when you put quarters in it? No? Well, that's what you see at a toy store. And you must think you're in a toy store, because you're here shopping for an infant named Jeb.";
    
    self.items = @[shortOne, longOne, mediumOne, superLongOne];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Item *item = self.items[indexPath.row];
    
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
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
