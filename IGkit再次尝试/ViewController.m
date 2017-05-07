//
//  ViewController.m
//  IGkit再次尝试
//
//  Created by Apple on 17/5/6.
//  Copyright © 2017年 李康滨,工作qq:1218773641. All rights reserved.
//

#import "ViewController.h"

#import "A.h"
#import "B.h"
//#import "nn.h"

@interface ViewController ()<IGListAdapterDelegate,IGListAdapterDataSource>

@property (nonatomic , strong ) NSArray * array;

@property (nonatomic , assign ) int a ;

@end


@implementation ViewController{

    IGListCollectionView*_collectionView;
    IGListAdapter*_adapter;
}
-(NSArray*)array{
    if (_array==nil){
        
        _array=@[@"1",@"2",@"3",@"4",@5];
    }
    
    return _array;
    
    
    
}


-(void)viewWillAppear:(BOOL)animated{
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    UICollectionViewFlowLayout*layout=[[UICollectionViewFlowLayout alloc]init];

    
    _collectionView=[[IGListCollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    
    IGListAdapterUpdater*updater=[[IGListAdapterUpdater alloc]init];
    
    //layout和updater可以自己定义.
    
//    IGListAdapter*adapter=[[IGListAdapter alloc]initWithUpdater:updater viewController:self];
    _adapter=[[IGListAdapter alloc]initWithUpdater:updater viewController:self workingRangeSize:0];
    
    _adapter.collectionView=_collectionView;
    
    _adapter.delegate=self;
    _adapter.dataSource=self;
    
    [self.view addSubview:_collectionView];
    
    _collectionView.backgroundColor=[UIColor grayColor];
    
    _collectionView.alpha=0.5;

    
    
    
}

-(void)viewWillLayoutSubviews{

    

}

-(void)viewDidLayoutSubviews{

_collectionView.frame=self.view.bounds;
}

/**
 Asks the data source for the objects to display in the list.
 
 @param listAdapter The list adapter requesting this information.
 
 @return An array of objects for the list.
 */
//一一对应关系
- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
   
    
    

    
   
    
    return  (NSArray<id <IGListDiffable>> *)self.array;
    
}

/**
 Asks the data source for a section controller for the specified object in the list.
 
 @param listAdapter The list adapter requesting this information.
 @param object      An object in the list.
 
 @return A new section controller instance that can be displayed in the list.
 
 @note New section controllers should be initialized here for objects when asked. You may pass any other data to
 the section controller at this time.
 
 Section controllers are initialized for all objects whenever the `IGListAdapter` is created, updated, or reloaded.
 Section controllers are reused when objects are moved or updated. Maintaining the `-[IGListDiffable diffIdentifier]`
 guarentees this.
 */
- (IGListSectionController <IGListSectionType> *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
//section初始化方法  ,此时可以传递数据过去
    
    
    A*a=[[A alloc]init];
    NSLog(@"%@",[object class]);
    if ([object isKindOfClass:[NSNumber class]]) {
        return [B new];
    }
    
    return (IGListSectionController <IGListSectionType> *)a;
    
    
    
}

/**
 Asks the data source for a view to use as the collection view background when the list is empty.
 
 @param listAdapter The list adapter requesting this information.
 
 @return A view to use as the collection view background, or `nil` if you don't want a background view.
 
 @note This method is called every time the list adapter is updated. You are free to return new views every time,
 but for performance reasons you may want to retain the view and return it here. The infra is only responsible for
 adding the background view and maintaining its visibility.
 */
//数据为空的时候返回一个view
- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter{
    UIView*view=[UIView new];
    view.backgroundColor=[UIColor blueColor];
    view.frame=CGRectMake(0, 50, 100, 100);

    return view ;
}
//代理
/**
 Notifies the delegate that a list object is about to be displayed.
 
 @param listAdapter The list adapter sending this information.
 @param object      The object that will display.
 @param index       The index of the object in the list.
 */
//将要显示secViewVC了.
- (void)listAdapter:(IGListAdapter *)listAdapter willDisplayObject:(id)object atIndex:(NSInteger)index{

     
}

/**
 Notifies the delegate that a list object is no longer being displayed.
 
 @param listAdapter The list adapter sending this information.
 @param object      The object that ended display.
 @param index       The index of the object in the list.
 */
//已经结束显示sectionVC了.
- (void)listAdapter:(IGListAdapter *)listAdapter didEndDisplayingObject:(id)object atIndex:(NSInteger)index{


}


@end
