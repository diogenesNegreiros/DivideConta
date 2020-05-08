//
//  AjudaViewControleViewController.h
//  Compras
//
//  Created by Diogenes de Souza Negreiros on 13/01/17.
//  Copyright © 2017 Diogenes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"

@interface AjudaViewControleViewController : UIViewController<UIWebViewDelegate>{
    UIWebView *web;
    UIActivityIndicatorView *indicador;
    
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButoon;
@property (strong, nonatomic) IBOutlet UIWebView *web;
@property(strong,nonatomic)IBOutlet UIActivityIndicatorView *indicador;


@property (strong, nonatomic) IBOutlet UINavigationItem *titleItem;
@property (weak, nonatomic) IBOutlet UIButton *comprarButton;



@end
