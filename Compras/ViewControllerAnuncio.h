//
//  ViewControllerAnuncio.h
//  Compras
//
//  Created by Diogenes de Souza on 10/10/17.
//  Copyright © 2017 Diogenes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"

@interface ViewControllerAnuncio : UIViewController<UIWebViewDelegate>{
    UIWebView *web;
    UIActivityIndicatorView *indicador;
    
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButoon;
@property (strong, nonatomic) IBOutlet UIWebView *web;
@property(strong,nonatomic)IBOutlet UIActivityIndicatorView *indicador;


@property (strong, nonatomic) IBOutlet UINavigationItem *titleItem;



@end

