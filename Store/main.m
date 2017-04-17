//
//  main.m
//  Store
//
//  Created by Jessica Donahue on 2/13/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Object_Info.h"

// Functions to be used in main
BOOL Add_Item(NSMutableDictionary **stock, NSString *name, NSString *description, float retail_cost,
              float wholesale_cost) {
    
    // if its the first item added, then create the dictionary
    if (*stock == nil) {
        *stock = [[NSMutableDictionary alloc] init];
        
        //create new object
        Object_Info *newObject = [[Object_Info alloc] init];
        [newObject setDescription:description];
        [newObject setRetail_Cost:retail_cost];
        [newObject setWholesale_Cost:wholesale_cost];
        [newObject setNum_Sold:0];
        [*stock setObject:newObject forKey:name];
        return YES;
    }
    else {
        //check if object is already in dictionay
        if ([*stock objectForKey:name]) {
            return NO;
        }
        else {
            //create new object
            Object_Info *newObject = [[Object_Info alloc] init];
            [newObject setDescription:description];
            [newObject setRetail_Cost:retail_cost];
            [newObject setWholesale_Cost:wholesale_cost];
            [newObject setNum_Sold:0];
            [*stock setObject:newObject forKey:name];
            return YES;
        }
    }
}
void Add_Stock(NSMutableDictionary **stock, NSString *name, int units) {
    
    //get the object from key - name
    id currentObject = [*stock objectForKey:name];
    
    //update the current Num_Sold variable on the object
    [currentObject setNum_on_Hand: ( [currentObject Num_on_Hand] + units ) ];
   
}

void Sell_Item(NSMutableDictionary **stock, NSString *name) {
    
    //get the object from key
    id currentObject = [*stock objectForKey:name];
    
    
    
    //get the num_on_hand
    int numHand = [currentObject Num_on_Hand];
    if (numHand == 0) {
        NSLog(@"Error: We are out of stock of %@, we cannot sell anymore.", name);
    }
    else {
        numHand--;
        [currentObject setNum_on_Hand:numHand];
        
        int numSold = [currentObject Num_Sold];
        numSold++;
        [currentObject setNum_Sold:numSold];
        NSLog(@"SOLD %@", name);
        //Print the object out to notify a sale
        [currentObject Print_Object];
    }
    
}

void Profit_of_Store(NSMutableDictionary **stock) {
    
    float totalProfit;
    
    for (id key in *stock) {
        
        id value = [*stock objectForKey:key];
        float profit = ([value Retail_Cost] - [value Wholesale_Cost]) * [value Num_Sold];
        
        totalProfit += profit;
    }
    
    NSLog(@"*** Total profit of store: $%.02f ***", totalProfit);
}

void Delete_Item(NSMutableDictionary **stock, NSString *name) {
    
    if([*stock objectForKey:name]){
        [*stock removeObjectForKey:name];
    }
    else {
        NSLog(@"%@ is already not in stock", name);
    }

}


int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSMutableDictionary *stock;

        
        // 1. Add some entries by hard-coding some calls to your "Add_Item" method
        Add_Item(&stock, @"iPhone 7", @"Apple's iPhone 7 minus plug", 769.00, 450.00);
        Add_Item(&stock, @"Galaxy Note7", @"Samsung's Exploding Phone", 850.00, 550.00);
        Add_Item(&stock, @"40-inch TV", @"Sony's LED TV", 298.00, 250.00);
        Add_Item(&stock, @"Kindle Reader", @"Amazon's E-Reader", 79.00, 75.00);
        Add_Item(&stock, @"Apple Watch", @"Series 2 - Aluminum Case", 299.00, 400.00);

        
        // 2. Add some stock to a few items by calling "Add_Stock"
        Add_Stock(&stock, @"iPhone 7", 2);
        Add_Stock(&stock, @"40-inch TV", 89);
        Add_Stock(&stock, @"Kindle Reader", 200);
        
        // 3. Print out the dictionary by enumerating it
        NSLog(@"~.~.~ IN STOCK ~.~.~.");
        for (id key in stock) {
            id value = [stock objectForKey:key];
            NSLog(@"- %@:", key);
            [value Print_Object];
        }
        NSLog(@"\n");
        
        // 4. Delete a few entries
        Delete_Item(&stock, @"Apple Watch");
        Delete_Item(&stock, @"Galaxy Note7");
        
        // 5. Print out the dictionary again.
        NSLog(@"~.~.~ IN STOCK ~.~.~.");
        for (id key in stock) {
            id value = [stock objectForKey:key];
            NSLog(@"- %@:", key);
            [value Print_Object];
        }
        NSLog(@"\n");
        
        // 6. Hard code a few calls to "Sell_Item" for several Key/Names
        Sell_Item(&stock, @"Kindle Reader");
        Sell_Item(&stock, @"iPhone 7");
        Sell_Item(&stock, @"40-inch TV");
        Sell_Item(&stock, @"iPhone 7");
        Sell_Item(&stock, @"iPhone 7");
        NSLog(@"\n");
        
        // 7. Print out the dictionary yet again.
        NSLog(@"~.~.~ IN STOCK ~.~.~.");
        for (id key in stock) {
            id value = [stock objectForKey:key];
            NSLog(@"- %@:", key);
            [value Print_Object];
        }
        NSLog(@"\n");
        //8. Print the total profit of the store
        Profit_of_Store(&stock);
        
        
    }
    return 0;
}

