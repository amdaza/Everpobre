
#import "AGTPhoto.h"

@interface AGTPhoto ()

// Private interface goes here.

@end

@implementation AGTPhoto

#pragma mark - Properties
/* OLD
 @synthesize image = _image;
 */
- (void) setImage:(UIImage *)image{
    //Don't use this
    //self.image = image;
    //It would create an infinite recursion
    
    
    //Autosinthesize not working on
    
    //Property from protocol
    //Property has an own setter or getter
    
    //More info: http://www.cocoaosx.com/2012/12/04/auto-synthesize-property-reglas-excepciones/
    /* OLD
     
     //Save in iV (instance vari	able)
     //_image = image;
     
     */
    
    //Syncronize with imageData
    self.imageData = UIImagePNGRepresentation(image);
}

//Getter
-(UIImage *) image {
    /* OLD
     //Lazy loading -> reduces memory use in time => don't load until it's necessary
     if(_image == nil){
     _image = [UIImage imageWithData:self.imageData];
     }
     return _image;
     
     */
    
    return [UIImage imageWithData:self.imageData];
}



#pragma mark - Class Methods

+(instancetype) photoWithImage:(UIImage *) image
                       context:(NSManagedObjectContext *) context{
    
    AGTPhoto *p = [NSEntityDescription
                   insertNewObjectForEntityForName:[AGTPhoto entityName]
                   inManagedObjectContext:context];
    
    //Before
    //p.imageData = UIImagePNGRepresentation(image);
    
    //After
    p.imageData = UIImageJPEGRepresentation(image, 0.9);//0.9 => High quality
    
    /* OLD
     
     //Subscribe to memory warning (not the best method)
     NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
     [nc addObserver:p
     selector:@selector(notifyThatDidReceiveMemoryWarning:)
     name: UIApplicationDidReceiveMemoryWarningNotification
     object:nil];
     
     */
    
    return p;
}

/*OLD
 
 #pragma mark - Notifications
 
 //See style guide
 //http://www.cocoaosx.com/2013/10/09/objetivec-style-guide-guia-de-estilo-objetivec-agbp/
 
 //UIApplicationDidReceiveMemoryWarningNotification
 - (void) notifyThatDidReceiveMemoryWarning: (NSNotification *) notification {
 _image = nil;
 }
 
 #pragma mark - Lifecycle
 
 - (void) dealloc {
 //Don't send dealloc to super
 //Unsuscribe from notification
 NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
 [nc removeObserver:self];
 }
 */

@end




