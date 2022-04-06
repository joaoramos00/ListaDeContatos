//
//  AppDelegate.h
//  Contacts
//
//  Created by João Luis Ferreira Ramos Junior on 31/03/22.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentCloudKitContainer *persistentContainer;

- (void)saveContext;

@end

