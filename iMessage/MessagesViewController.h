#import <Messages/Messages.h>

@interface MessagesViewController : MSMessagesAppViewController <UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak,nonatomic) IBOutlet UICollectionView* collectionView;

@property (strong,nonatomic) MSConversation* currentConversation;
@property (strong,nonatomic) MSMessage* currentMessage;


@end
