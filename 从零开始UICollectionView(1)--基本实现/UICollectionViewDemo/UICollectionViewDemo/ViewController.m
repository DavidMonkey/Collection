//
//  ViewController.m
//  UICollectionViewDemo
//
//  Created by bradleyjohnson on 2016/10/27.
//  Copyright © 2016年 bradleyjohnson. All rights reserved.
//

#import "ViewController.h"
#import "MainCollectionViewCell.h"
#import "MainCollectionHeaderView.h"
#import "MainCollectionFooterView.h"

#import "MainModel.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic , strong) UICollectionView * mainCollectionView;

@property (nonatomic , strong) NSArray * dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.mainCollectionView];
}

#pragma mark - data source methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataArray.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray * subArray = self.dataArray[section];
    return subArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MainCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:[MainCollectionViewCell reuseIdentifier] forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor orangeColor];
    cell.contentView.frame = cell.bounds;
    cell.backgroundColor = [UIColor lightGrayColor];
    
    MainModel * model = self.dataArray[indexPath.section][indexPath.row];
    
    cell.title = model.indexStr;
    
    return cell;
}

//
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath;
//{
//    UICollectionReusableView * reusableview = nil;
//
//    if (kind == UICollectionElementKindSectionHeader){
//
//        MainCollectionHeaderView * headerV = (MainCollectionHeaderView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[MainCollectionHeaderView reuseIdentifier] forIndexPath:indexPath];
//
//        headerV.backgroundColor = [UIColor redColor];
//        headerV.title = [NSString stringWithFormat:@"这是第 %ld 组头部视图",indexPath.section];
//
//        reusableview = headerV;
//
//    }
//
//    if (kind == UICollectionElementKindSectionFooter){
//
//        MainCollectionFooterView * footerV = (MainCollectionFooterView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[MainCollectionFooterView reuseIdentifier] forIndexPath:indexPath];
//
//        footerV.backgroundColor = [UIColor greenColor];
//        footerV.title = [NSString stringWithFormat:@"这是第 %ld 组尾部视图",indexPath.section];
//
//        reusableview = footerV;
//
//    }
//
//    return reusableview;
//}

//是否允许移动 item
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(9_0)
{
    return YES;
}

//移动 item 行为
- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath NS_AVAILABLE_IOS(9_0)
{

}

#pragma mark - UICollectionViewDelegate methods
//是否允许某个 item 的高亮，返回NO，则不能进入高亮状态
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
//高亮状态触发的方法
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor grayColor];
    
    NSLog(@"%ld--%ld : 高亮状态触发",indexPath.section,indexPath.item);
}
//高亮状态结束触发的方法
- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor lightGrayColor];
    
    NSLog(@"%ld--%ld : 高亮状态结束触发",indexPath.section,indexPath.item);
}
//能否选中某个 item，返回NO，则不能被选中
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//能否取消某个 item 的选中状态，返回NO，则不能取消被选中
- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
//选中某个 item 触发
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MainModel * model = self.dataArray[indexPath.section][indexPath.item];
    NSLog(@"选中 : %@",model.indexStr);
}

//取消某个 item 触发
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"取消选中 : %ld--%ld",indexPath.section,indexPath.item);
}

//将要加载某个 item 触发
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0)
{
    
}

//将要加载某个头部尾部视图时触发
- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0)
{
    
}

//某个 item 消失时候触发
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

//加载完成某个头部尾部视图消失时候触发
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(UICollectionReusableView *)view forElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    
}

//这个方法设置是否展示长按菜单
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//这个方法用于设置要展示的菜单选项 只支持 cut: 、copt: 、paste: ， 通过对对应方法的返回来设置
- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender
{
    return YES;
}

//这个方法用于实现点击菜单按钮后的触发方法,通过测试，只有copy，cut和paste三个方法可以使用
- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender
{
    NSLog(@"%@",NSStringFromSelector(action));
}

//这个方法用于通过layout进行重新布局调用的方法
//- (nonnull UICollectionViewTransitionLayout *)collectionView:(UICollectionView *)collectionView transitionLayoutForOldLayout:(UICollectionViewLayout *)fromLayout newLayout:(UICollectionViewLayout *)toLayout
//{
//    
//}

#pragma mark - UICollectionViewDelegateFlowLayout methods
// cell 尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.view.bounds.size.width-5-5-20*2)/3.0, (self.view.bounds.size.height-60) / 2 );
}

// 装载内容 cell 的内边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

//最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 20;
}

//item最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 50.0f;
}
//
////头视图尺寸
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(self.view.bounds.size.width, 50);
//}
//
////尾视图尺寸
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
//{
//    return CGSizeMake(self.view.bounds.size.width, 50);
//}

#pragma mark - initializes attributes

-(UICollectionView *)mainCollectionView
{
    if (!_mainCollectionView) {
        UICollectionViewFlowLayout * layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
//        layout.minimumLineSpacing
        
        CGRect rect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        _mainCollectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout];
        _mainCollectionView.backgroundColor = [UIColor whiteColor];
        _mainCollectionView.delegate = self;
        _mainCollectionView.dataSource = self;
        
        [_mainCollectionView registerClass:[MainCollectionViewCell class] forCellWithReuseIdentifier:[MainCollectionViewCell reuseIdentifier]];
        [_mainCollectionView registerClass:[MainCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[MainCollectionHeaderView reuseIdentifier]];
        [_mainCollectionView registerClass:[MainCollectionFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[MainCollectionFooterView reuseIdentifier]];
    }
    
    return _mainCollectionView;
}

-(NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSArray alloc] init];
        
        NSMutableArray * theArray = [NSMutableArray array];
        for (NSInteger index = 0; index < 3; index++) {
            NSMutableArray * subArray = [NSMutableArray array];
            for (NSInteger indexJ = 0; indexJ < 10; indexJ++) {
                MainModel * model = [MainModel new];
                model.indexStr = [NSString stringWithFormat:@"%ld-%ld",index,indexJ];
                model.scale = (arc4random()%11)/10.0+1;
                [subArray addObject:model];
            }
            [theArray addObject:[NSArray arrayWithArray:subArray]];
        }
        
        _dataArray = [NSArray arrayWithArray:theArray];
    }
    
    return _dataArray;
}

@end
