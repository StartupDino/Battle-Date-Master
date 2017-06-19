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
    BattleDate(description: "Battle of Waterloo", year: 1815),
    BattleDate(description: "Battle of Hyrba", year: -552),
    BattleDate(description: "Battle of Pingyu", year: -221),
    BattleDate(description: "Battle of Lake Regillus", year: -496),
    BattleDate(description: "Battle of Salamis", year: -480),
    BattleDate(description: "Sack of Carthage", year: -146),
    BattleDate(description: "Conquest of Mecca", year: 630),
    BattleDate(description: "Battle of Qadisiya", year: 636),
    BattleDate(description: "Battle of Yarmouk", year: 636),
    BattleDate(description: "Sack of Constantinople", year: 1204),
    BattleDate(description: "Battle of the Thirteen Sides", year: 1201),
    BattleDate(description: "Battle of Maritsa", year: 1371),
    BattleDate(description: "Siege of Nanjing", year: 1938),
    BattleDate(description: "Battle of the Kondurcha River", year: 1391),
    BattleDate(description: "Battle of Technochticlan", year: 1521),
    BattleDate(description: "Battle of Diu", year: 1509),
    BattleDate(description: "Siege of Vienna", year: 1529),
    BattleDate(description: "Battle of Breitenfeld", year: 1631),
    BattleDate(description: "Battle of Rocroi", year: 1643),
    BattleDate(description: "Battle of Mollwitz", year: 1741),
    BattleDate(description: "Siege of Toulon", year: 1793),
    BattleDate(description: "Battle of Trafalgar", year: 1805),
    BattleDate(description: "Battle of Borodino", year: 1812),
    BattleDate(description: "The Spring Offensive", year: 1918),
    BattleDate(description: "The Long March", year: 1935),
    BattleDate(description: "Stalingrad", year: 1943),
    BattleDate(description: "Battle of Fort Sumter", year: 1861),
    BattleDate(description: "Siege of Corinth", year: 1862),
    BattleDate(description: "Battle of Gettysburg", year: 1863),
    BattleDate(description: "Battle of Appomattox Court House", year: 1865),
    BattleDate(description: "2nd Battle of Petersburg", year: 1864),
    BattleDate(description: "Battle of Bunker Hill", year: 1775),
    BattleDate(description: "Batlle of Fort Washington", year: 1776),
    BattleDate(description: "Battle of Germantown", year: 1777),
    BattleDate(description: "Battle of the Bulge", year: 1945),
    BattleDate(description: "Battle of Moscow", year: 1942)
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
