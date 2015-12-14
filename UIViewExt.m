//
//  AddressViewController.m
//  PetBar
//
//  Created by juvham on 14-5-23.
//  Copyright (c) 2014年 EZ. All rights reserved.
//

#import "UIViewExt.h"

CGPoint CGRectGetCenter(CGRect rect)
{
    CGPoint pt;
    pt.x = CGRectGetMidX(rect);
    pt.y = CGRectGetMidY(rect);
    return pt;
}

CGRect CGRectMoveToCenter(CGRect rect, CGPoint center)
{
    CGRect newrect = CGRectZero;
    newrect.origin.x = center.x-CGRectGetMidX(rect);
    newrect.origin.y = center.y-CGRectGetMidY(rect);
    newrect.size = rect.size;
    return newrect;
}

@implementation UIView (ViewGeometry)

// Retrieve and set the origin
- (CGPoint) origin
{
	return self.frame.origin;
}

- (void) setOrigin: (CGPoint) aPoint
{
	CGRect newframe = self.frame;
	newframe.origin = aPoint;
	self.frame = newframe;
}


// Retrieve and set the size
- (CGSize) size
{
	return self.frame.size;
}

- (void) setSize: (CGSize) aSize
{
	CGRect newframe = self.frame;
	newframe.size = aSize;
	self.frame = newframe;
}

// Query other frame locations
- (CGPoint) bottomRight
{
	CGFloat x = self.frame.origin.x + self.frame.size.width;
	CGFloat y = self.frame.origin.y + self.frame.size.height;
	return CGPointMake(x, y);
}

- (CGPoint) bottomLeft
{
	CGFloat x = self.frame.origin.x;
	CGFloat y = self.frame.origin.y + self.frame.size.height;
	return CGPointMake(x, y);
}

- (CGPoint) topRight
{
	CGFloat x = self.frame.origin.x + self.frame.size.width;
	CGFloat y = self.frame.origin.y;
	return CGPointMake(x, y);
}

- (CGPoint) topLeft
{
	CGFloat x = self.frame.origin.x;
	CGFloat y = self.frame.origin.y;
	return CGPointMake(x, y);
}

// Retrieve and set height, width, top, bottom, left, right
- (CGFloat) height
{
	return self.frame.size.height;
}

- (void) setHeight: (CGFloat) newheight
{
	CGRect newframe = self.frame;
	newframe.size.height = newheight;
	self.frame = newframe;
}

- (CGFloat) width
{
	return self.frame.size.width;
}

- (void) setWidth: (CGFloat) newwidth
{
	CGRect newframe = self.frame;
	newframe.size.width = newwidth;
	self.frame = newframe;
}

- (CGFloat) top
{
	return self.frame.origin.y;
}

- (void) setTop: (CGFloat) newtop
{
	CGRect newframe = self.frame;
	newframe.origin.y = newtop;
	self.frame = newframe;
}

- (CGFloat) left
{
	return self.frame.origin.x;
}

- (void) setLeft: (CGFloat) newleft
{
	CGRect newframe = self.frame;
	newframe.origin.x = newleft;
	self.frame = newframe;
}

- (CGFloat) bottom
{
	return self.frame.origin.y + self.frame.size.height;
}

- (void) setBottom: (CGFloat) newbottom
{
	CGRect newframe = self.frame;
	newframe.origin.y = newbottom - self.frame.size.height;
	self.frame = newframe;
}

- (CGFloat) right
{
	return self.frame.origin.x + self.frame.size.width;
}

- (void) setRight: (CGFloat) newright
{
	CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
	CGRect newframe = self.frame;
	newframe.origin.x += delta ;
	self.frame = newframe;
}

// Move via offset
- (void) moveBy: (CGPoint) delta
{
	CGPoint newcenter = self.center;
	newcenter.x += delta.x;
	newcenter.y += delta.y;
	self.center = newcenter;
}

// Scaling
- (void) scaleBy: (CGFloat) scaleFactor
{
	CGRect newframe = self.frame;
	newframe.size.width *= scaleFactor;
	newframe.size.height *= scaleFactor;
	self.frame = newframe;
}

// Ensure that both dimensions fit within the given size by scaling down
- (void) fitInSize: (CGSize) aSize
{
	CGFloat scale;
	CGRect newframe = self.frame;
	
	if (newframe.size.height && (newframe.size.height > aSize.height))
	{
		scale = aSize.height / newframe.size.height;
		newframe.size.width *= scale;
		newframe.size.height *= scale;
	}
	
	if (newframe.size.width && (newframe.size.width >= aSize.width))
	{
		scale = aSize.width / newframe.size.width;
		newframe.size.width *= scale;
		newframe.size.height *= scale;
	}
	
	self.frame = newframe;	
}
/*
+ (UIView*)initWithImages: (NSArray*)imgs rect: (CGRect)rect
{
    NSUInteger count = imgs.count;
    UIView *view = [[UIView alloc] initWithFrame: rect];
    // view.backgroundColor = UIColorFromRGB(169, 169, 169);
    rect.origin.x = 0;
    rect.origin.y = 0;

    if (!count)
    {
        return view;
    }
    else if (1 == count)
    {
        NSString *imgUrl = [imgs objectAtIndex: 0][@"url"];
        CacheImageView *thumbnailImageView = [[CacheImageView alloc] init];
        thumbnailImageView.frame = rect;
        [thumbnailImageView placeholderImageName: @"Placeholder"];
        [thumbnailImageView loadURL: imgUrl];
        [view addSubview: thumbnailImageView];
    }
    else if (2 == count)
    {
        for (int i=0; i<2; i++)
        {
            if (!i)
            {
                rect = CGRectMake(0, 0, rect.size.width, (rect.size.height / 2) - 1);
            }
            else
            {
                rect = CGRectMake(0, (rect.size.height / 2) + 1, rect.size.width, (rect.size.height / 2) - 1);
            }

            NSString *imgUrl = [imgs objectAtIndex: i][@"url"];
            CacheImageView *thumbnailImageView = [[CacheImageView alloc] init];
            thumbnailImageView.frame = rect;
            [thumbnailImageView placeholderImageName: @"Placeholder"];
            [thumbnailImageView loadURL: imgUrl];
            [view addSubview: thumbnailImageView];
        }
    }
    else if (3 == count)
    {
        for (int i=0; i<3; i++)
        {
            if (!i)
            {
                rect = CGRectMake(0, 0, rect.size.width, rect.size.height / 2 - 1);
            }
            else if (1 == i)
            {
                rect = CGRectMake(0, rect.size.height / 2 + 1, rect.size.width / 2 - 1, rect.size.height / 2 - 1);
            }
            else
            {
                rect = CGRectMake(rect.size.width / 2 + 1, rect.size.height / 2 + 1, rect.size.width / 2 - 1, rect.size.height / 2 - 1);
            }
            
            NSString *imgUrl = [imgs objectAtIndex: i][@"url"];
            CacheImageView *thumbnailImageView = [[CacheImageView alloc] init];
            thumbnailImageView.frame = rect;
            [thumbnailImageView placeholderImageName: @"Placeholder"];
            [thumbnailImageView loadURL: imgUrl];
            [view addSubview: thumbnailImageView];
        }
    }
    else
    {
        for (int i=0; i<4; i++) // 最多显示4张
        {
            if (!i)
            {
                rect = CGRectMake(0, 0, rect.size.width / 2 - 1, rect.size.height / 2 - 1);
            }
            else if (1 == i)
            {
                rect = CGRectMake(rect.size.width / 2 + 1, 0, rect.size.width / 2 - 1, rect.size.height / 2 - 1);
            }
            else if (2 == i)
            {
                rect = CGRectMake(0, rect.size.height / 2 + 1, rect.size.width / 2 - 1, rect.size.height / 2 - 1);
            }
            else
            {
                rect = CGRectMake(rect.size.width / 2 + 1, rect.size.height / 2 + 1, rect.size.width / 2 - 1, rect.size.height / 2 - 1);
            }
            
            NSString *imgUrl = [imgs objectAtIndex: i][@"url"];
            CacheImageView *thumbnailImageView = [[CacheImageView alloc] init];
            thumbnailImageView.frame = rect;
            [thumbnailImageView placeholderImageName: @"Placeholder"];
            [thumbnailImageView loadURL: imgUrl];
            [view addSubview: thumbnailImageView];
        }
    }
    
    return view;
}
 */

@end