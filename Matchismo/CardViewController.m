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
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (strong,nonatomic)Deck *deck;
@property (nonatomic,strong) CardMatchingGame *game;

@end

@implementation CardViewController

-(CardMatchingGame *)game{
    if(!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}

-(Deck *)createDeck{
    
    return [[PlayingCardDeck alloc]init];
}


- (IBAction)touchCardButton:(UIButton *)sender {
    unsigned long cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];

}

-(void)updateUI{
    for (UIButton *cardButton in self.cardButtons){
        unsigned long cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card ] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        
    }
}

-(NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
}


-(UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardFront" : @"subzeroCardBack"];
}

@end














