//
//  TelaDeCalculo.h
//  Compras
//
//  Created by mac on 10/07/15.
//  Copyright (c) 2015 Diogenes. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMobileAds;

@interface TelaDeCalculo : UIViewController
    /*
    UITextField *display;
    UITextField *valor1;
    UITextField *valor2;
    UITextField *valor3;
    UITextField *valor4;
    UITextField *percentual2;
    UITextField *percentual1;
    UISegmentedControl *escolha;
     */

-(NSString*)dividir: (UITextField*)nun1 numero2: (UITextField*)nun2;
-(NSString*)multiplicar: (UITextField*)nun1 numero2: (UITextField*)nun2;
-(NSString*)somar: (UITextField*)nun1 numero2: (UITextField*)nun2;
-(NSString*)subtrair: (UITextField*)nun1 numero2: (UITextField*)nun2;




-(NSString*)percentValor:(UITextField*)valorPrincipal percentual:(UITextField*) percentual;
-(NSString*)percentDesconto: (UITextField*)nun1 percentual: (UITextField*)desconto;
-(NSString*)percentRepresentaValor: (UITextField*)nun1 numero2: (UITextField*)nun2;
-(NSString*) valorJuros:(UITextField*)Valor juros:(UITextField*)juros periodo:(UITextField*)periodo tipoJuros:(int) index;
-(NSString*)valorJurosComposto:(UITextField*)Valor juros:(UITextField*)juros periodo:(UITextField*)
periodo simulaPrince:(UISwitch*) simulaPrice tipoJuros:(int) index;
-(NSString*)calcularLucro:(UITextField*)fieldTotalCompra quantidade:(UITextField*)fieldQuantidade unidadeVenda:(UITextField*)fieldUnidadeVenda;
-(NSString*)calcularValorDeVenda:(UITextField*)fieldTotalCompra quantidade:(UITextField*)fieldQuantidade lucroDesejado:(UITextField*)fieldLucroDesejado;

-(NSString*)divideConta:(UITextField*)fieldTotalConta pessoas:(UITextField*) fieldPessoas desconto:(UITextField*)fieldDesconto artistico:(UITextField*)fieldArtistico garcon:(UISwitch*) SwitchGarcon percentGarcon:(UITextField*)percentGarcon;

- (void)apagarTextField:(UITextField*)texto;
- (void)apagarTextView:(UITextView*)texto;
-(BOOL)validaCampoNumerico:(UITextField*)fieldtexto;
-(BOOL)validaNumeroDecimal:(UITextField*)fieldText;
- (void)testarNumeroDecimal:(UITextField*)TextField;
-(void)addToolBarCalc:(UITextField*)TextField;
-(void)doneWithNumberPad:(UITextField*)field;
- (void)testarNumeroInteiro:(UITextField*)TextField;
-(BOOL)validaNumeroInteiro:(UITextField*)fieldText;
-(void)showInterstitial:(GADInterstitial*)interstitial  request:(GADRequest*)request;
-(void)showBanner:(GADBannerView*) bannerViewAds;


    
   
    




@end
