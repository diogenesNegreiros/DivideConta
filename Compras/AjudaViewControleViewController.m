//
//  AjudaViewControleViewController.m
//  Compras
//
//  Created by Diogenes de Souza Negreiros on 13/01/17.
//  Copyright © 2017 Diogenes. All rights reserved.
//

#import "AjudaViewControleViewController.h"
#import "SWRevealViewController.h"

@interface AjudaViewControleViewController ()

@end

@implementation AjudaViewControleViewController

@synthesize web, indicador;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_comprarButton setTitle:NSLocalizedString(@"Text_comprar_button", nil)forState:UIControlStateNormal];
    
    [self flashOn:_comprarButton];
    
//    [UIView setAnimationRepeatCount:1000];
//    [UIView setAnimationRepeatAutoreverses:YES];
    
//    [_comprarButton setAlpha:0.0f];
//    [_comprarButton setSelected:true];
    
    _titleItem.title = NSLocalizedString(@"Men_aju", nil);
    
    
    //para implementar o indicador activity
    web.delegate = self;
    
    //Para carregar descomente. Web site: loadURL.
   
//    [self loadURL];
    
    
   
    //Para carregar descomente. Código html: loadHTML.
   
    [self loadHTML];
    
    
    //para o indicador de carregamento
     
    
   
    //Para carregar descomente. Arquivo html: loadHTMLFile.
    
//    [self loadHTMLFile];

    
    
    //retorna para o menu lateral
   
    SWRevealViewController *revealViewController = self.revealViewController;
    
    if ( revealViewController )
    {
        [self.sidebarButoon setTarget: self.revealViewController];
        [self.sidebarButoon setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    
    
    

}

- (void)loadURL {
//    NSString *urlAddress = @"http://www.aplicativosmobilemaker.com.br/";
//    
//    //Create a URL object.
//    NSURL *url = [NSURL URLWithString:urlAddress];
//    
//    //URL Requst Object
//    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
//    
//    //Load the request in the UIWebView.
//    [web loadRequest:requestObj];
    
    
    
    NSURL *websiteUrl = [NSURL URLWithString:@"http://www.google.com"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:websiteUrl];
    [web loadRequest:urlRequest];
    
    
    
}

- (void)loadHTMLFile{
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [web loadHTMLString:htmlString baseURL:nil];
}

-(void)loadHTML{
    //load html content into webview
    
    
    [web loadHTMLString:NSLocalizedString(@"Tex_aju", nil) baseURL:nil];
    
    

    
}

- (void)flashOff:(UIView *)v
{
    [UIView animateWithDuration:.05 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^ {
        v.alpha = .01;  //don't animate alpha to 0, otherwise you won't be able to interact with it
    } completion:^(BOOL finished) {
        [self flashOn:v];
    }];
}

- (void)flashOn:(UIView *)v
{
    [UIView animateWithDuration:1.8 delay:0.3 options:UIViewAnimationOptionAllowUserInteraction animations:^ {
        v.alpha = 1;
    } completion:^(BOOL finished) {
        [self flashOff:v];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




//delegate

-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    [indicador startAnimating];
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
   [indicador stopAnimating];
}


- (void)webView:(UIWebView *)wv didFailLoadWithError:(NSError *)error
{
    [indicador stopAnimating];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
