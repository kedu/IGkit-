//
//  A.m
//  IGkit再次尝试
//
//  Created by Apple on 17/5/6.
//  Copyright © 2017年 李康滨,工作qq:1218773641. All rights reserved.
//

#import "A.h"

@interface A ()

@end

@implementation A{
    NSString*_object;

}



- (instancetype)init
{
    self = [super init];
    if (self) {
        self.inset=UIEdgeInsetsMake(2, 1, 2, 1);
        self.minimumLineSpacing=5;
        self.minimumInteritemSpacing=2;
        
        NSLog(@"我被创造出来了");
        
        
        
    }
    return self;
}



- (NSInteger)numberOfItems{
    
    NSLog(@"%s",__func__);

   
    NSInteger a=2;
    
    NSLog(@"%f",self.collectionContext.containerSize.width);
    
     NSLog(@"返回数量%ld",a);
    return 20;
}




- (CGSize)sizeForItemAtIndex:(NSInteger)index{

     NSLog(@"返回大小");
    return  CGSizeMake(40, 80);

}

-(UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index{
//    UICollectionViewCell*cell=[UICollectionViewCell new];
//    collectionContext!.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as! LabelCell
    UICollectionViewCell*cell=[self.collectionContext dequeueReusableCellOfClass:[UICollectionViewCell class] forSectionController:self atIndex:index];
        cell.backgroundColor=[UIColor redColor];
    
    
         NSLog(@"cell");
    
    
        return cell;



}

- (void)didUpdateToObject:(id)object{
  
    _object =[NSString stringWithFormat:@"%@",object];

//    String(describing: object)
    NSLog(@"%@",object);


}

- (void)didSelectItemAtIndex:(NSInteger)index{}


@end
