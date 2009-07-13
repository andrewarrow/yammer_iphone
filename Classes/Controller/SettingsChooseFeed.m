//
//  SettingsChooseFeed.m
//  Yammer
//
//  Created by aa on 2/3/09.
//  Copyright 2009 Yammer, Inc. All rights reserved.
//

#import "SettingsChooseFeed.h"
#import "FeedsTableDataSource.h"
#import "LocalStorage.h"

@implementation SettingsChooseFeed

@synthesize dataSource;
@synthesize theTableView;
@synthesize parent;

- (id)initWithDict:(NSMutableDictionary *)dict parent:(SettingsViewController *)view {
  self.title = @"Choose Feed";
  self.parent = view;
	theTableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]
                                              style:UITableViewStyleGrouped];  
  
	theTableView.autoresizingMask = (UIViewAutoresizingNone);
	theTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
	
	theTableView.delegate = self;  
  self.dataSource = [FeedsTableDataSource getFeeds:dict klass:@"SettingsChooseFeed"];
	theTableView.dataSource = self.dataSource;
  self.view = theTableView;
  
  return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {  
  [theTableView deselectRowAtIndexPath:indexPath animated:YES];
  [LocalStorage saveFeedInfo:[dataSource feedAtIndex:indexPath.row]];
  [parent.theTableView reloadData];
  [self.navigationController popViewControllerAnimated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 40.0;
}

- (void)dealloc {
  [dataSource release];
  [theTableView release];
  [parent release];
  [super dealloc];
}


@end
