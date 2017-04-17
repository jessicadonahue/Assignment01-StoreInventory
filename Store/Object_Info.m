//
//  Object_Info.m
//  Store
//
//  Created by Jessica Donahue on 2/13/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "Object_Info.h"

@implementation Object_Info {
    // Instance Variables
    NSString *Name;
    NSString *Description;
    float Cost;
    int Num_on_Hand;
    NSString *Product_Image;
}

// Getters and Setters
- (NSString *) Name {
    return Name;
}
- (void) setName:(NSString *)newName {
    Name = newName;
}

- (NSString *) Description {
    return Description;
}
- (void) setDescription:(NSString *)newDescription {
    Description = newDescription;
}

- (float) Cost {
    return Cost;
}
- (void) setCost:(float)newCost {
    Cost = newCost;
}


- (int) Num_on_Hand {
    return Num_on_Hand;
}
- (void) setNum_on_Hand:(int)newNum_on_Hand {
    if (newNum_on_Hand) {
        Num_on_Hand = newNum_on_Hand;
    }
    else {
        Num_on_Hand = 0;
    }
}


-(NSString *) Product_Image{
    return Product_Image;
}

-(void) setProduct_Image : (NSString *)newProduct_Image{
    Product_Image = newProduct_Image;
}



// Methods
- (void) Print_Object;
{
    NSString *s = [NSString stringWithFormat:@"\tDescription: %@, Cost: $%.02f, Num on Hand: %i", Description, Cost, Num_on_Hand];
    NSLog(@"%@",s);
}


@end
