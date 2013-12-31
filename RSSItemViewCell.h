//
//  RSSItemViewCell.h
//  Nerdfeed
//
//  Created by Alan Sparrow on 12/31/13.
//  Copyright (c) 2013 Alan Sparrow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSItemViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleTextField;
@property (weak, nonatomic) IBOutlet UILabel *authorTextField;
@property (weak, nonatomic) IBOutlet UILabel *categoryTextField;

@end
