//
//  Object_Info.h
//  Store
//
//  Created by Jessica Donahue on 2/13/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Object_Info : NSObject {
    
}
    
// Getters and Setters
-(NSString *) Name;
-(void) setName:(NSString *) newName;

- (NSString *) Description;
- (void) setDescription:(NSString *)newDescription;

- (float) Cost;
- (void) setCost:(float)newRetail_Cost;


- (int) Num_on_Hand;
- (void) setNum_on_Hand:(int)newNum_on_Hand;


-(NSString *) Product_Image;
-(void) setProduct_Image:(NSString *)newProduct_Image;

// Methods
- (void) Print_Object;

@end
