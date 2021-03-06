//
//  PublicGalView.m
//  CubeConstruct
//
//  Created by Kris Temmerman on 11/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PublicGalView.h"


#import "HorImageGalPublic.h"
#import "ASIFormDataRequest.h"
#include "Model.h"
@implementation PublicGalView
@synthesize gal;
@synthesize request;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)loadView
{
    
    
    
}



- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated
{
  [[NSURLCache sharedURLCache] setMemoryCapacity:1024*1024*10];
    Model * model =Model::getInstance();
    model->isDirty =true;
    
   /* UILabel *scoreLabel = [ [UILabel alloc ] initWithFrame:CGRectMake(10.0, 5.0,200.0, 20.0) ];
    scoreLabel.textAlignment =  UITextAlignmentCenter;
    scoreLabel.textColor = [UIColor colorWithRed:0.8 green:0.0 blue:0.0 alpha:1.0];
    scoreLabel.font = [UIFont fontWithName:@"Helvetica-Bold"  size:(20.0)  ];
    scoreLabel.text = @"PUBLIC GALLERY"; 
    [self.view addSubview:scoreLabel];
    */
      
    
    
    [request cancel];
	[self setRequest:[ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://cubeconstruct.net/entries"]]];
	
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_0
	[request setShouldContinueWhenAppEntersBackground:YES];
#endif
    [request setDelegate:self];
	[request setDidFailSelector:@selector(uploadFailed:)];
	[request setDidFinishSelector:@selector(uploadFinished:)];
	[request setTimeOutSeconds:20];
	
	
	[request startAsynchronous];
	//[resultView setText:@"Uploading data..."];
    
 
    
}


- (void)uploadFailed:(ASIHTTPRequest *)theRequest
{
    
  
    Model::getInstance()->cancelOverlay();
    
    UIAlertView *alert  =[[UIAlertView alloc] initWithTitle:@"Sorry :)" message:@"I can't seem to connect to the server, you need to be online to use the public gallery" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
   //  [theRequest release];
    
    [alert show];
    [alert release];
}

- (void)uploadFinished:(ASIHTTPRequest *)theRequest
{
   
    NSData *r =[theRequest.responseString  dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;

    NSDictionary *obj  =(NSDictionary *) [NSJSONSerialization JSONObjectWithData:r  options:NSJSONReadingMutableLeaves error:&error];
    
    
    NSArray *arr =[obj allValues];
    
    
    
 
    
    
    gal =[[HorImageGalPublic alloc] init];
    CGRect frame = self.view.frame;
    gal.view.transform = CGAffineTransformMakeRotation(M_PI/2.0);
    gal.view .frame = CGRectMake(0,0, frame.size.width, frame.size.height);   
        
    //NSDictionary *test = [arr objectAtIndex:0];
   // NSString *im =  [test objectForKey:@"image" ]; 
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"date"  ascending:NO];
    NSMutableArray *arrM =[[NSMutableArray alloc] initWithArray:arr];
    [arrM sortUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
    NSArray *reversed = [NSArray arrayWithArray:arrM];
  //  NSArray *reversed = [[NSArray alloc] init
    gal.arr = reversed ;
    [descriptor release];
    [arrM release];
   
    [self.view addSubview:gal.view];
    
    
    
   
    
    
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
 
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}
-(void)dealloc
{
    [request cancel];
    [request release ];
    [gal release];
    [super dealloc];
}
@end
