//
//  CBAlbumViewController.m
//  Listados y colecciones
//
//  Created by Carlos on 23/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBAlbumViewController.h"
#import "CBMarcoViewController.h"
#import "CBCollectionCellPhoto.h"

@interface CBAlbumViewController ()

@end

@implementation CBAlbumViewController
@synthesize album = _album;

- (NSMutableArray *) album{
    
    if(!_album){
        _album = [NSMutableArray new];
        for (int i=0; i<10; i++){
            [_album addObject: [NSString stringWithFormat:@"img%d.jpg", i]];
        }
    }
    return _album;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.album.count;
    
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CBCollectionCellPhoto * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellFrame" forIndexPath:indexPath];
    
    cell.imgFile = [self.album objectAtIndex:indexPath.row];
    return cell;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"showPhoto"]){
        
        CBMarcoViewController * destino = segue.destinationViewController;
        NSIndexPath * indexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        destino.imageFile = [self.album objectAtIndex:indexPath.row];
        
    }
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
