//
//  ContatcsDao.m
//  Contacts
//
//  Created by João Luis Ferreira Ramos Junior on 05/04/22.
//

#import "ContatcsDao.h"

@implementation ContatcsDao

static ContatcsDao *defaultDao = nil;

- (id) init {
    self = [super init];
    if(self) {
        self.contatos = [NSMutableArray new];
    }
    return self;
}

+(ContatcsDao *) contatsDaoInstance {
    if (!defaultDao) {
        defaultDao = [ContatcsDao new];
    }
    return defaultDao;
}

- (void) adicionaContato: (Contato *) contato {
    [self.contatos addObject:contato];
}

-(NSInteger)total {
    return  self.contatos.count;
}


- (Contato *) contatoDoIndice: (NSInteger) indice {
    return self.contatos[indice];
}

- (void) removeContato:(Contato *) contato {
    [self.contatos removeObject:contato];
}

- (NSInteger) indiceDoContato:(Contato *)contato {
    return [self.contatos indexOfObject:contato];
}
@end
