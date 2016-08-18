//
//  CardViewController.m
//  Matchismo
//
//  Created by MacMan on 8/17/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic)int flipCount;
@property (strong,nonatomic)Deck *deck;
@property (nonatomic,strong) CardMatchingGame *game;

@end

@implementation CardViewController

-(CardMatchingGame *)game{
    if(!_game) _game = [[CardMatchingGame alloc]initWithCardCount:0 usingDeck:[self createDeck]];
    return _game;
}

-(Deck *)deck{
    
    if(!_deck) _deck = [self createDeck];
    
    return _deck;
}

-(Deck *)createDeck{
    
    return [[PlayingCardDeck alloc]init];
}

-(void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips:%d",self.flipCount];
    NSLog(@"flipCount = %d",self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if([sender.currentTitle length]){
        [sender setBackgroundImage:[UIImage imageNamed:@"subzeroCardBack"] forState:UIControlStateNormal];
        [sender setTitle:@""   forState:UIControlStateNormal];
        self.flipCount++;
    }else{
        Card *card =[self.deck drawRandomCard];
        if(card)
        [sender setBackgroundImage:[UIImage imageNamed:@"cardFront"] forState:UIControlStateNormal];
        [sender setTitle: card.contents forState:UIControlStateNormal];
            self.flipCount++;
    }
    
}


@end














