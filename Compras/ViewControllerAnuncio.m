//
//  ViewControllerAnuncio.m
//  Compras
//
//  Created by Diogenes de Souza on 10/10/17.
//  Copyright © 2017 Diogenes. All rights reserved.
//

#import "ViewControllerAnuncio.h"
#import "SWRevealViewController.h"

@interface ViewControllerAnuncio ()

@end

@implementation ViewControllerAnuncio

@synthesize web, indicador;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titleItem.title = NSLocalizedString(@"Men_no_Anuncio", nil);
    
    //para implementar o indicador activity
    web.delegate = self;
    
    //Para carregar descomente. Web site: loadURL.
    
        [self loadURL];
    
    
    
    //Para carregar descomente. Código html: loadHTML.
    
//    [self loadHTML];
    
    
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
//        NSString *urlAddress = @"http://www.aplicativosmobilemaker.com.br/";
//
//        //Create a URL object.
//        NSURL *url = [NSURL URLWithString:urlAddress];
//
//        //URL Requst Object
//        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
//
//        //Load the request in the UIWebView.
//        [web loadRequest:requestObj];
    
    
    
    NSURL *websiteUrl = [NSURL URLWithString:@"http://www.aplicativosmobilemaker.com.br/"];
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
    
    
    [web loadHTMLString:NSLocalizedString(@"Men_no_Anuncio", nil) baseURL:nil];
    
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
    [indicador isHidden];
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

