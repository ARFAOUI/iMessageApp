#import "MessagesViewController.h"


@interface MessagesViewController ()

@end

@implementation MessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Conversation Handling

-(void)didBecomeActiveWithConversation:(MSConversation *)conversation {
    self.currentConversation = conversation;
}

-(void)willResignActiveWithConversation:(MSConversation *)conversation {
    // Called when the extension is about to move from the active to inactive state.
    // This will happen when the user dissmises the extension, changes to a different
    // conversation or quits Messages.
    
    // Use this method to release shared resources, save user data, invalidate timers,
    // and store enough state information to restore your extension to its current state
    // in case it is terminated later.
}

-(void)didReceiveMessage:(MSMessage *)message conversation:(MSConversation *)conversation {
    // Called when a message arrives that was generated by another instance of this
    // extension on a remote device.
    
    // Use this method to trigger UI updates in response to the message.
}

-(void)didStartSendingMessage:(MSMessage *)message conversation:(MSConversation *)conversation {
    // Called when the user taps the send button.
}

-(void)didCancelSendingMessage:(MSMessage *)message conversation:(MSConversation *)conversation {
    // Called when the user deletes the message without sending it.
    
    // Use this to clean up state related to the deleted message.
}

-(void)willTransitionToPresentationStyle:(MSMessagesAppPresentationStyle)presentationStyle {
    // Called before the extension transitions to a new presentation style.
    
    // Use this method to prepare for the change in presentation style.
}

-(void)didTransitionToPresentationStyle:(MSMessagesAppPresentationStyle)presentationStyle {
    // Called after the extension transitions to a new presentation style.
    
    // Use this method to finalize any behaviors associated with the change in presentation style.
}
#pragma Collectionview
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"imessageCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier
                                                                           forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self buildMessage:indexPath.row];
}

#pragma sending message handling
- (void)buildMessage:(float)index{
    self.currentMessage = [MSMessage new];
    [self.currentMessage setURL:[NSURL URLWithString:@"https://google.de"]];
    [self.currentMessage setSummaryText:@"this is a test"];
    
    MSMessageTemplateLayout* layout = [MSMessageTemplateLayout new];
    [layout setMediaFileURL:[NSURL URLWithString:@"https://httpsimage.com/img/teacup-french-bulldog-wallpaper-1.jpg"]];
    [layout setImage:[UIImage imageNamed:@"frenchie-pebbles.jpg"]];
    [layout setCaption:@"very sweet frenchies"];
    
    [self.currentMessage setLayout:layout];
    __weak typeof(self) weakSelf = self;
    [self.currentConversation insertMessage:self.currentMessage completionHandler:^(NSError* error){
        [weakSelf.currentConversation insertText:@"http://google.com" completionHandler:^(NSError* error){
            
        }];
    }];
    
  
  
    
}
@end
