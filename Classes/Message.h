#import <CoreData/CoreData.h>
#import "TTTableYammerItem.h"

@interface Message: NSManagedObject {
}

@property (nonatomic, retain) NSNumber *message_id;
@property (nonatomic, retain) NSNumber *latest_reply_id;
@property (nonatomic, retain) NSString *from;
@property (nonatomic, retain) NSString *plain_body;
@property (nonatomic, retain) NSNumber *privacy;
@property (nonatomic, retain) NSString *feed;

@property (nonatomic, retain) NSDate *created_at;
@property (nonatomic, retain) NSDate *latest_reply_at;
@property (nonatomic, retain) NSNumber *network_id;


@property (nonatomic, retain) NSString *actor_mugshot_url;
@property (nonatomic, retain) NSNumber *actor_id;
@property (nonatomic, retain) NSString *actor_type;
@property (nonatomic, retain) NSString *group_full_name;
@property (nonatomic, retain) NSString *attachments_json;

@property (nonatomic, retain) NSString *sender;
@property (nonatomic, retain) NSString *thread_url;
@property (nonatomic, retain) NSNumber *thread_updates;
@property (nonatomic, retain) NSNumber *likes;
@property (nonatomic, retain) NSNumber *liked_by_me;

- (NSMutableDictionary*)safeMessage;
+ (NSString*)timeString:(TTTableYammerItem*)item;

@end

