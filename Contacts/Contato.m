//
//  Contato.m
//  Contacts
//
//  Created by João Luis Ferreira Ramos Junior on 01/04/22.
//

#import "Contato.h"

@implementation Contato

- (NSString *)description {
    NSString *dados = [NSString stringWithFormat:@"Nome: %@ Endereco: %@ Email: %@ Site: %@ Telefone: $%@"
                       ,self.nome, self.end, self.email, self.site, self.telefone];
    return dados;
}

@end
