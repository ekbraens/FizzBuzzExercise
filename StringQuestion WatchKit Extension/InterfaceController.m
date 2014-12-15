//
//  InterfaceController.m
//  StringQuestion WatchKit Extension
//
//  Created by New on 12/15/14.
//  Copyright (c) 2014 Braen. All rights reserved.
//

#import "InterfaceController.h"
#import "FizzBuzzTableController.h"

@interface InterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceTable *table;
@property (nonatomic, strong) NSMutableArray * theNumbers;

@end


@implementation InterfaceController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        NSLog(@"%@ initWithContext", self);
        
        _theNumbers = [[NSMutableArray alloc] init];
        for (int i = 0; i < 100; ++i)
        {
            _theNumbers[i] = [NSString stringWithFormat:@"%i", i+1];
        }
        
        [self configureTableWithData:_theNumbers];
    }
    return self;
}

- (void)configureTableWithData:(NSArray*)dataObjects {
    [self.table setNumberOfRows:[dataObjects count] withRowType:@"OnlyRow"];
    for (NSInteger i = 0; i < self.table.numberOfRows; i++) {
        NSString * output = @"";
        
        FizzBuzzTableController* theRow = [self.table rowControllerAtIndex:i];
        //MyDataObject* dataObj = [dataObjects objectAtIndex:i];
        
        if ([dataObjects[i] intValue] % 3 == 0)
        {
            output = [output stringByAppendingString:@"Fizz"];
            [theRow.outputLabel setText:output];
        }
        if ([dataObjects[i] intValue] % 5 == 0)
        {
            output = [output stringByAppendingString:@"Buzz"];
            [theRow.outputLabel setText:output];
        }
        if ([output isEqual: @""])
        {
            [theRow.outputLabel setText:dataObjects[i]];
        }
    }
}


- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    NSLog(@"%@ will activate", self);
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
}

@end



