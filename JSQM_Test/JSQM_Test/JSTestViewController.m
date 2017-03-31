//
//  JSTestViewController.m
//  JSQM_Test
//
//  Created by kfz on 16/11/5.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import "JSTestViewController.h"

@interface JSTestViewController ()<JSQMessagesInputToolbarDelegate>

@end

@implementation JSTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"聊天界面";
    
    self.demoModelData = [[DemoModelData alloc] init];
    
    CGSize avatarSize = CGSizeMake(35, 35);
    self.collectionView.collectionViewLayout.incomingAvatarViewSize = avatarSize;
    self.collectionView.collectionViewLayout.outgoingAvatarViewSize = avatarSize;
    
    
    self.inputToolbar.delegate = self;
    
}



#pragma -mark UICollectionViewDataSource
//@required
- (NSString *)senderDisplayName {
    return kJSQDemoAvatarDisplayNameSquires;
}
- (NSString *)senderId {
    return kJSQDemoAvatarIdSquires;
}
- (id<JSQMessageData>)collectionView:(JSQMessagesCollectionView *)collectionView messageDataForItemAtIndexPath:(NSIndexPath *)indexPath {
    JSQMessage *message = self.demoModelData.messages[indexPath.item];
    
    return message;
}
- (void)collectionView:(JSQMessagesCollectionView *)collectionView didDeleteMessageAtIndexPath:(NSIndexPath *)indexPath {
    [self.demoModelData.messages removeObjectAtIndex:indexPath.item];
}

- (nullable id<JSQMessageBubbleImageDataSource>)collectionView:(JSQMessagesCollectionView *)collectionView messageBubbleImageDataForItemAtIndexPath:(NSIndexPath *)indexPath {
    JSQMessage *message = self.demoModelData.messages[indexPath.item];
    
    if ([message.senderId isEqualToString:self.senderId]) {
        return self.demoModelData.outgoingBubbleImageData;
    } else {
        return self.demoModelData.incomingBubbleImageData;
    }
}

- (nullable id<JSQMessageAvatarImageDataSource>)collectionView:(JSQMessagesCollectionView *)collectionView avatarImageDataForItemAtIndexPath:(NSIndexPath *)indexPath {
    JSQMessage *message = self.demoModelData.messages[indexPath.item];
    
    return self.demoModelData.avatars[message.senderId];
}
- (nullable NSAttributedString *)collectionView:(JSQMessagesCollectionView *)collectionView attributedTextForCellTopLabelAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item % 3 == 0) {
        JSQMessage *message = self.demoModelData.messages[indexPath.item];
        NSDate *date = [message date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:ss:mm"];
        NSString *timeString = [formatter stringFromDate:date];
        NSAttributedString *attStr = [[NSAttributedString alloc] initWithString:timeString attributes:@{
                                                                                                        NSFontAttributeName : [UIFont systemFontOfSize:13]
                                                                                                        }];
        return attStr;
    }
    return nil;
}


#pragma -mark JSQMessagesCollectionViewDelegateFlowLayout
- (CGFloat)collectionView:(JSQMessagesCollectionView *)collectionView
                   layout:(JSQMessagesCollectionViewFlowLayout *)collectionViewLayout heightForCellTopLabelAtIndexPath:(NSIndexPath *)indexPath {
    return 19;
}

#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.demoModelData.messages count];
}

- (UICollectionViewCell *)collectionView:(JSQMessagesCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    JSQMessagesCollectionViewCell *cell = (JSQMessagesCollectionViewCell *)[super collectionView:collectionView cellForItemAtIndexPath:indexPath];
    
    JSQMessage *msg = [self.demoModelData.messages objectAtIndex:indexPath.item];
    
    if (!msg.isMediaMessage) {
        
        if ([msg.senderId isEqualToString:self.senderId]) {
            cell.textView.textColor = [UIColor blackColor];
        }
        else {
            cell.textView.textColor = [UIColor whiteColor];
        }
        
        cell.textView.linkTextAttributes = @{ NSForegroundColorAttributeName : cell.textView.textColor,
                                              NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle | NSUnderlinePatternSolid) };
    }
    
    cell.accessoryButton.hidden = ![self shouldShowAccessoryButtonForMessage:msg];
    
    return cell;
}
/**
 * 末尾的分享按钮
 */
- (BOOL)shouldShowAccessoryButtonForMessage:(id<JSQMessageData>)message
{
    return (arc4random() % 2);  //
}
#pragma -mark JSQMessagesInputToolbarDelegate
- (void)messagesInputToolbar:(JSQMessagesInputToolbar *)toolbar
      didPressRightBarButton:(UIButton *)sender {
    DLOG(@"%s", __func__);
    toolbar.contentView.textView.text = nil;
//    UIView
}

/**
 *  Tells the delegate that the toolbar's `leftBarButtonItem` has been pressed.
 *
 *  @param toolbar The object representing the toolbar sending this information.
 *  @param sender  The button that received the touch event.
 */
- (void)messagesInputToolbar:(JSQMessagesInputToolbar *)toolbar
       didPressLeftBarButton:(UIButton *)sender {
    DLOG(@"%s", __func__);
}

//- (CGFloat)collectionView:(JSQMessagesCollectionView *)collectionView
//                   layout:(JSQMessagesCollectionViewFlowLayout *)collectionViewLayout heightForMessageBubbleTopLabelAtIndexPath:(NSIndexPath *)indexPath {
//    return 20;
//}
//- (nullable NSAttributedString *)collectionView:(JSQMessagesCollectionView *)collectionView attributedTextForMessageBubbleTopLabelAtIndexPath:(NSIndexPath *)indexPath {
//    return [[NSAttributedString alloc] initWithString:@"bubbleTopLabel" attributes:@{
//                                                                                    NSFontAttributeName : [UIFont systemFontOfSize:14],
//                                                                                    NSForegroundColorAttributeName :[UIColor redColor]
//                                                                                    }];
//}

@end











