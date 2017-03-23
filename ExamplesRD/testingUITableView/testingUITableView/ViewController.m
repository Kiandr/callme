//
//  ViewController.m
//  testingUITableView
//
//  Created by Kian Davoudi-Rad on 2017-03-21.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//

#import "ViewController.h"
//#define FONT_SIZE 14.0f
//#define CELL_CONTENT_WIDTH 300.0f
//#define CELL_CONTENT_MARGIN 10.0f
@interface ViewController ()

@property (nonatomic, strong) UITableView *uiTableView;
@property (nonatomic, strong) NSArray *timeZoneNames;
@property (nonatomic, strong) UIColor *NNDBrandColour;
@property (nonatomic, strong) NSIndexPath *NSIndexPathVar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _NNDBrandColour= [UIColor colorWithRed:236.0f green:0.0f blue:139.0f alpha:1.0f];

    _uiTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, 400, 400) style:UITableViewCellStyleSubtitle];
    _uiTableView.dataSource = self;
    _uiTableView.delegate = self;
    _uiTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_uiTableView];
    

    

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}











#pragma mark - UITableViewDataSource
// number of section(s), now I assume there is only 1 section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;

}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

//- (CGFloat)tableView:(UITableView *)tableView
//heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//
//    return (50);
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    // Init tableView

    tableView.rowHeight = 80.0f;

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];


    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyCell"];
    }


    // Date
    cell.textLabel.frame = CGRectMake(0,0,50,50);
    // TODO:
    // You need a string serializer to built date and name into a single line.
    // Define how many letters do you need, and inject that into one signle line.

    cell.textLabel.text = @"John Oliver";
    //cell.textLabel.font = [UIFont italicSystemFontOfSize];
    cell.textLabel.textAlignment = UITextAlignmentLeft;
    [cell.textLabel adjustsFontSizeToFitWidth];
    [cell.textLabel sizeToFit];
    cell.textLabel.numberOfLines = 2;
    cell.textLabel.textColor = _NNDBrandColour;
    [cell.textLabel setFont: [cell.textLabel.font fontWithSize: 20]];

    UILabel *date = [[UILabel alloc] init];
    date.text  = @"12:00 0 14:00";
    date.textColor = _NNDBrandColour;
    [date setFont: [date.font fontWithSize: 20]];
    // Image Google map
    UIImageView *googleUIImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"google_maps-512"]];
    googleUIImageView.frame = CGRectMake(cell.accessoryView.frame.size.width+100, 20, 30, 30);
    cell.accessoryView = date;
    cell.accessoryView.frame = CGRectMake(0, 0, 150, 20);
    cell.accessoryView.translatesAutoresizingMaskIntoConstraints = YES;
    [cell.accessoryView addSubview:googleUIImageView];


    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0,cell.textLabel.frame.size.height+2,150.0f,20.0f)];
    lbl.textAlignment = UITextAlignmentLeft;
    lbl.font = [UIFont fontWithName:@"SF" size:14.0f];
    lbl.textColor = [UIColor lightGrayColor];
    lbl.text = [@"Ref.No. " stringByAppendingString:@"test"];

    [cell.textLabel addSubview:lbl];




    UISwipeGestureRecognizer* recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    [recognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
    // set to yes if you want both events go hand to hand


    [recognizer setCancelsTouchesInView:YES];


    [cell addGestureRecognizer:recognizer];
      UILabel *detail = [[UILabel alloc] init];
//    detail.text  = @" 1788 W 5th Ave #300, Vancouver, BC V6J 1P2";
//    detail.textColor = [UIColor grayColor];
//    detail.frame  = CGRectMake(0, 0, 150, 50);
////    [detail setFont: [detail.font fontWithSize: 10]];
//
//    [cell.detailTextLabel.frame addSubview:detail];
////    cell.detailTextLabel.text
//    = detail.text;
////    cell.detailTextLabel.textAlignment = UITextAlignmentCenter;
////    cell.detailTextLabel.numberOfLines = 2;
//
////    cell.accessoryView.frame = CGRectMake(0, 0, 150, 50);
////    cell.accessoryView.translatesAutoresizingMaskIntoConstraints = YES;





    //    cell.textLabel.text=(@"Barb & jacj @ 09:00 - 11:00 PDT ");
//    cell.detailTextLabel.text = (@" Melvyn Bragg and guests discuss what is often called one of the most significant battles in history. In 480BC in the Saronic Gulf near Athens, between the mainland and the island of Salamis, a fleet of Greek allies decisively defeated a larger Persian-led fleet. This halted the further Persian conquest of Greece and, at Plataea and Mycale the next year, further Greek victories brought Persian withdrawal and the immediate threat of conquest to an end. To the Greeks, this enabled a flourishing of a culture that went on to influence the development of civilisation in Rome and, later, Europe and beyond. To the Persians, it was a reverse at the fringes of their vast empire but not a threat to their existence, as it was for the Greek states, and attention turned to quelling unrest elsewhere.");
//    cell.textLabel.textColor= _NNDBrandColour;
//    cell.detailTextLabel.numberOfLines = 3;
//    cell.detailTextLabel.textColor= [UIColor grayColor];

//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"google_maps-512"]];
//    cell.accessoryView = imageView;
//    cell.accessoryView.frame = CGRectMake(0, 0, 50, 50);
//    cell.accessoryView.translatesAutoresizingMaskIntoConstraints = YES;
//    NSLayoutConstraint *leading = [NSLayoutConstraint
//                                   constraintWithItem:nil
//                                   attribute:NSLayoutAttributeLeading
//                                   relatedBy:NSLayoutRelationEqual
//                                   toItem:nil
//                                   attribute:NSLayoutAttributeLeading
//                                   multiplier:1.0f
//                                   constant:0.f];
//    [cell addSubview:leading];
//    //    cell.accessoryView.



//    UIButton *scanQRCodeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    scanQRCodeButton.frame = CGRectMake(250, 0, 50.0f, 30);
//    scanQRCodeButton.backgroundColor = [UIColor redColor];
//    [scanQRCodeButton setTitle:@"Hello" forState:UIControlStateNormal];
//    [cell addSubview:scanQRCodeButton];


    return cell;
}

#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _NSIndexPathVar = indexPath;
    NSLog(@"selected  %@ row",indexPath );
}


-(void)handleSwipe:(UISwipeGestureRecognizer *) sender
{


    CGPoint location = [sender locationInView:_uiTableView];
    NSIndexPath *swipedIndexPath = [_uiTableView indexPathForRowAtPoint:location];
    UITableViewCell *swipedCell  = [_uiTableView cellForRowAtIndexPath:swipedIndexPath];

//    NSLog(@"location = %@, swipedIndexPath = %@, swipedCell = %@", location, swipedIndexPath,swipedCell);


}
@end
