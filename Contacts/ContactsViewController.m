//
//  ContactsViewController.m
//  Contacts
//
//  Created by João Luis Ferreira Ramos Junior on 04/04/22.
//

#import "ContactsViewController.h"
#import "Contato.h"

@implementation ContactsViewController



- (id) init {
    
    self = [super init];
    if (self) {
        UIBarButtonItem *botaoForm = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeForm)];
        
        self.navigationItem.rightBarButtonItem = botaoForm;
        self.navigationItem.title = @"Contatos";
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        self.linhaSelecionada = -1;
        
        self.dao = [ContatcsDao contatsDaoInstance];
    }
    return self;
}

- (void) exibeForm {
    UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *form = [storybord instantiateViewControllerWithIdentifier:@"Form-Contato"];
    form.delegate = self;
    if (self.contatoSelecionado) {
        form.contato = self.contatoSelecionado;
    }
    self.contatoSelecionado = nil;
    
    [self.navigationController pushViewController:form animated:YES ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.dao total];
}
   
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identificador = @"Celular";
    
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier: identificador];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: identificador];
    }
    Contato *contato = [self.dao contatoDoIndice:indexPath.row];
    cell.textLabel.text = contato.nome;
    return cell;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Contato *contato = [self.dao contatoDoIndice:indexPath.row];
        [self.dao removeContato: contato];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.contatoSelecionado = [self.dao contatoDoIndice:indexPath.row];
    [self exibeForm];
}

- (void) contatoAdicionado: (Contato *)contato {
    self.linhaSelecionada =  [self.dao indiceDoContato: contato];
    NSString *msg = [NSString stringWithFormat:@"Contato %@ adicionado com sucesso", contato.nome];
    UIAlertController *alerta =[UIAlertController alertControllerWithTitle:@"Contato adicionado" message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
    [alerta addAction:ok];
    [self presentViewController:alerta animated:YES completion:nil];
}

- (void) contatoAtualizado: (Contato *)contato {
    self.linhaSelecionada =  [self.dao indiceDoContato: contato];
}

- (void) viewDidAppear:(BOOL)animated {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.linhaSelecionada inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
}
@end
