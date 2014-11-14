//
//  CBPredicadosViewController.m
//  Modelo1
//
//  Created by Carlos on 30/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBPredicadosViewController.h"


@interface CBPredicadosViewController ()

@end

@implementation CBPredicadosViewController


- (NSManagedObjectContext *) contexto {
    CBAppDelegate * app = [[UIApplication sharedApplication] delegate];
    return app.managedObjectContext1;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    


    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) mostrar:(NSArray *)usuarios{
    
    Usuario * u;
    
    NSLog(@"===== Resultado =====");
    NSLog(@"Nombre\t\t\tSexo\t\t\tEdad\t\t\tFoto\t\t\tEstado Civil\t\t\tA\t\t\tB");
    for (int i=0; i < usuarios.count; i++) {
        u= [usuarios objectAtIndex:i];
        NSLog(@"%@\t\t\t%@\t\t\t%d\t\t\t%@\t\t\t%@\t\t\t%d\t\t\t%d",
              u.nombre,
              u.sexo,
              u.edad,
              u.foto,
              u.estadoCivil,
              u.a,
              u.b);
    }
    
}

- (IBAction)mostrarTodos:(id)sender {
    
    NSError * error;
    
    NSFetchRequest * request = [[NSFetchRequest new] initWithEntityName:@"Usuario"];
    
    NSArray * resultado = [self.contexto executeFetchRequest:request error:&error];
    
    NSLog(@"Todos los usuarios");
    
    [self mostrar:resultado];
    
}

- (IBAction)mostrarMujeres:(id)sender {
    
    NSError * error;
    
    NSFetchRequest * request = [[NSFetchRequest new] initWithEntityName:@"Usuario"];
    
    request.predicate = [NSPredicate predicateWithFormat:@"sexo='Mujer'"];
    
    NSArray * resultado = [self.contexto executeFetchRequest:request error:&error];
    
    NSLog(@"Todas las mujeres");
    
    [self mostrar:resultado];
    
}

- (IBAction)mostrarHombres:(id)sender {
    
    NSError * error;
    
    NSFetchRequest * request = [[NSFetchRequest new] initWithEntityName:@"Usuario"];
    
    request.predicate = [NSPredicate predicateWithFormat:@"sexo='Hombre'"];
    
    NSArray * resultado = [self.contexto executeFetchRequest:request error:&error];
    
    NSLog(@"Todos los hombres");
    
    [self mostrar:resultado];
    
}

- (IBAction)mostrarMujeresMenoresDe30:(id)sender {
    
    NSError * error;
    
    NSFetchRequest * request = [[NSFetchRequest new] initWithEntityName:@"Usuario"];
    
    request.predicate = [NSPredicate predicateWithFormat:@"sexo='Mujer' AND edad<30"];
    
    NSArray * resultado = [self.contexto executeFetchRequest:request error:&error];
    
    NSLog(@"Mujeres menores de 30");
    
    [self mostrar:resultado];
    
}

- (IBAction)mostrarHombresEntre30y50:(id)sender {
    
    NSError * error;
    
    NSFetchRequest * request = [[NSFetchRequest new] initWithEntityName:@"Usuario"];
    
    request.predicate = [NSPredicate predicateWithFormat:@"sexo='Hombre' AND edad<50 AND edad>30"];
    
    NSArray * resultado = [self.contexto executeFetchRequest:request error:&error];
    
    NSLog(@"Hombres entre 30 y 50");
    
    [self mostrar:resultado];
    
}

- (IBAction)mostrarMenoresDe25SolterosConB:(id)sender {
    
    NSError * error;
    
    NSFetchRequest * request = [[NSFetchRequest new] initWithEntityName:@"Usuario"];
    
    request.predicate = [NSPredicate predicateWithFormat:@"edad<25 AND estadoCivil='Soltero/a' AND b=1"];
    
    NSArray * resultado = [self.contexto executeFetchRequest:request error:&error];
    
    NSLog(@"Menores de 25 solteros y con carnet B");
    
    [self mostrar:resultado];
    
}
@end
