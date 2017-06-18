//
//  BattleDates.swift
//  Battle Date Master
//
//  Created by Pete McPherson on 6/14/17.
//  Copyright © 2017 Pete McPherson. All rights reserved.
//

import Foundation
import GameKit

protocol BattleDateType {
    var description: String { get }
    var year: Int { get }
}

struct BattleDate: BattleDateType {
    var description: String
    var year: Int
}

var allBattles: [BattleDate] = [
    BattleDate(description: "Battle of Marathon", year: -490),
    BattleDate(description: "Battle of Guagamela", year: -331),
    BattleDate(description: "Battle of Syracuse", year: -413),
    BattleDate(description: "Battle of the Metaurus", year: -207),
    BattleDate(description: "Battle of the Teutoburg Forest", year: 9),
    BattleDate(description: "Battle of Arbela", year: -331),
    BattleDate(description: "Battle of Chalons", year: 451),
    BattleDate(description: "Battle of Tours", year: 732),
    BattleDate(description: "Battle of Hastings", year: 1066),
    BattleDate(description: "Siege of Orleans", year: 1429),
    BattleDate(description: "Defeat of the Spanish Armada", year: 1588),
    BattleDate(description: "Battle of Blenheim", year: 1704),
    BattleDate(description: "Battle of Pultowa", year: 1709),
    BattleDate(description: "Victory of the Americas at Saratoga", year: 1777),
    BattleDate(description: "Battle of Valmy", year: 1792),
    BattleDate(description: "Battle of Waterloo", year: 1815)
]

var roundBattles = [BattleDate]() // will contain the 4 random battles for each round
var battleIndex = Array(0...(allBattles.count - 1))
var roundBattlesIndex = [Int]()

// This function selects 4 random and non-repeating battles for each round.

func chooseBattlesForRound() {
    
    for _ in 1...4 {
        let randomNum = GKRandomSource.sharedRandom().nextInt(upperBound: battleIndex.count)
        roundBattlesIndex.append(battleIndex[randomNum])
        battleIndex.remove(at: randomNum)
    }
        
    var i = 0
    
    while i < roundBattlesIndex.count {
        roundBattles.append(allBattles[battleIndex[i]])
        i += 1
    }
}
