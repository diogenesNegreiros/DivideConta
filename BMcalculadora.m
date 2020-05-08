//
//  BMcalculadora.m
//  Compras
//
//  Created by Diogenes de Souza Negreiros on 28/03/16.
//  Copyright © 2016 Diogenes. All rights reserved.
//

#import "BMcalculadora.h"

@implementation BMcalculadora

-(void)somar: (NSInteger) inteiro{
    self.registrador = self.registrador + inteiro;
}
-(void)subtrair:(NSInteger) inteiro{
     self.registrador = self.registrador - inteiro;
}
-(void)multiplicar:(NSInteger) inteiro{
     self.registrador = self.registrador * inteiro;
}
-(void)dividir:(double) inteiro{
    self.registrador = self.registrador/ inteiro;
}


@end
