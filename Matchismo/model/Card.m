//
//  Card.m
//  kpCardMatching
//
//  Created by MacMan on 8/15/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "Card.h"


@interface Card()

@end



@implementation Card

-(int)match:(NSArray *)otherCards{
    int score =0;
    
    for(Card *card in otherCards){
        
        if([card.contents isEqual:self.contents]){
        score = 1;
        }
    }
return score;
}
@end
