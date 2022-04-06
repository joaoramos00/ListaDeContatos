//
//  ContatcsDao.h
//  Contacts
//
//  Created by João Luis Ferreira Ramos Junior on 05/04/22.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContatcsDao : NSObject

@property NSMutableArray *contatos;

- (void) adicionaContato: (Contato*) contato;
- (NSInteger) total;
- (Contato *)  contatoDoIndice: (NSInteger) indice; 

+ (ContatcsDao *) contatsDaoInstance;

- (void) removeContato: (Contato *) contato;
- (NSInteger) indiceDoContato: (Contato *) contato;

@end

NS_ASSUME_NONNULL_END
