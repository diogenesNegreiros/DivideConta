//
//  BMcalculadora.h
//  Compras
//
//  Created by Diogenes de Souza Negreiros on 28/03/16.
//  Copyright © 2016 Diogenes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BMcalculadora : NSObject{
    
}

@property (nonatomic) double registrador;
-(void)somar:(NSInteger) inteiro;
-(void)subtrair:(NSInteger) inteiro;
-(void)multiplicar:(NSInteger) inteiro;
-(void)dividir:(double) inteiro;

@end
