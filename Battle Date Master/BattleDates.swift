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
    var link: String { get }
}

struct BattleDate: BattleDateType {
    var description: String
    var year: Int
    var link: String
}

var allBattles: [BattleDate] = [
    BattleDate(description: "Battle of Marathon", year: -490, link: "https://en.wikipedia.org/wiki/Battle_of_Marathon"),
    BattleDate(description: "Battle of Guagamela", year: -331, link: "https://en.wikipedia.org/wiki/Battle_of_Gaugamela"),
    BattleDate(description: "Battle of Syracuse", year: -413, link: "https://en.wikipedia.org/wiki/Sicilian_Expedition"),
    BattleDate(description: "Battle of the Metaurus", year: -207, link: "https://en.wikipedia.org/wiki/Battle_of_the_Metaurus"),
    BattleDate(description: "Battle of the Teutoburg Forest", year: 9, link: "https://en.wikipedia.org/wiki/Battle_of_the_Teutoburg_Forest"),
    BattleDate(description: "Battle of Arbela", year: -331, link: "https://en.wikipedia.org/wiki/Battle_of_Gaugamela"),
    BattleDate(description: "Battle of Chalons", year: 451, link: "https://en.wikipedia.org/wiki/Battle_of_the_Catalaunian_Plains"),
    BattleDate(description: "Battle of Tours", year: 732, link: "https://en.wikipedia.org/wiki/Battle_of_Tours"),
    BattleDate(description: "Battle of Hastings", year: 1066, link: "https://en.wikipedia.org/wiki/Battle_of_Hastings"),
    BattleDate(description: "Siege of Orleans", year: 1429, link: "https://en.wikipedia.org/wiki/Siege_of_Orl%C3%A9ans"),
    BattleDate(description: "Defeat of the Spanish Armada", year: 1588, link: "https://en.wikipedia.org/wiki/Spanish_Armada"),
    BattleDate(description: "Battle of Blenheim", year: 1704, link: "https://en.wikipedia.org/wiki/Battle_of_Blenheim"),
    BattleDate(description: "Battle of Pultova", year: 1709, link: "https://en.wikipedia.org/wiki/Battle_of_Poltava"),
    BattleDate(description: "Victory of the Americas at Saratoga", year: 1777, link: "https://en.wikipedia.org/wiki/Battles_of_Saratoga"),
    BattleDate(description: "Battle of Valmy", year: 1792, link: "https://en.wikipedia.org/wiki/Battle_of_Valmy"),
    BattleDate(description: "Battle of Waterloo", year: 1815, link: "https://en.wikipedia.org/wiki/Battle_of_Waterloo"),
    BattleDate(description: "Battle of Hyrba", year: -552, link: "https://en.wikipedia.org/wiki/Battle_of_Hyrba"),
    BattleDate(description: "Battle of Pingyu", year: -221, link: "https://en.wikipedia.org/wiki/Qin%27s_wars_of_unification"),
    BattleDate(description: "Battle of Lake Regillus", year: -496, link: "https://en.wikipedia.org/wiki/Battle_of_Lake_Regillus"),
    BattleDate(description: "Battle of Salamis", year: -480, link: "https://en.wikipedia.org/wiki/Battle_of_Salamis"),
    BattleDate(description: "Sack of Carthage", year: -146, link: "https://en.wikipedia.org/wiki/Battle_of_Carthage_(c._149_BC)"),
    BattleDate(description: "Conquest of Mecca", year: 630, link: "https://en.wikipedia.org/wiki/Conquest_of_Mecca"),
    BattleDate(description: "Battle of Qadisiya", year: 636, link: "https://en.wikipedia.org/wiki/Battle_of_al-Q%C4%81disiyyah"),
    BattleDate(description: "Battle of Yarmouk", year: 636, link: "https://en.wikipedia.org/wiki/Battle_of_Yarmouk"),
    BattleDate(description: "Sack of Constantinople", year: 1204, link: ""),
    BattleDate(description: "Battle of the Thirteen Sides", year: 1201, link: ""),
    BattleDate(description: "Battle of Maritsa", year: 1371, link: ""),
    BattleDate(description: "Siege of Nanjing", year: 1938, link: ""),
    BattleDate(description: "Battle of the Kondurcha River", year: 1391, link: ""),
    BattleDate(description: "Battle of Technochticlan", year: 1521, link: ""),
    BattleDate(description: "Battle of Diu", year: 1509, link: ""),
    BattleDate(description: "Siege of Vienna", year: 1529, link: ""),
    BattleDate(description: "Battle of Breitenfeld", year: 1631, link: ""),
    BattleDate(description: "Battle of Rocroi", year: 1643, link: ""),
    BattleDate(description: "Battle of Mollwitz", year: 1741, link: ""),
    BattleDate(description: "Siege of Toulon", year: 1793, link: ""),
    BattleDate(description: "Battle of Trafalgar", year: 1805, link: ""),
    BattleDate(description: "Battle of Borodino", year: 1812, link: ""),
    BattleDate(description: "The Spring Offensive", year: 1918, link: ""),
    BattleDate(description: "The Long March", year: 1935, link: ""),
    BattleDate(description: "Stalingrad", year: 1943, link: ""),
    BattleDate(description: "Battle of Fort Sumter", year: 1861, link: ""),
    BattleDate(description: "Siege of Corinth", year: 1862, link: ""),
    BattleDate(description: "Battle of Gettysburg", year: 1863, link: ""),
    BattleDate(description: "Battle of Appomattox Court House", year: 1865, link: ""),
    BattleDate(description: "2nd Battle of Petersburg", year: 1864, link: ""),
    BattleDate(description: "Battle of Bunker Hill", year: 1775, link: ""),
    BattleDate(description: "Batlle of Fort Washington", year: 1776, link: ""),
    BattleDate(description: "Battle of Germantown", year: 1777, link: ""),
    BattleDate(description: "Battle of the Bulge", year: 1945, link: ""),
    BattleDate(description: "Battle of Moscow", year: 1942, link: "")
]



// This function selects 4 random and non-repeating battles for each round.

func chooseBattlesForRound() -> [BattleDate] {
    
    var roundBattles = [BattleDate]() // will contain the 4 random battles for each round
    var battleIndex = Array(0...(allBattles.count - 1))
    var roundBattlesIndex = [Int]()
    
    for _ in 1...4 {
        let randomNum = GKRandomSource.sharedRandom().nextInt(upperBound: battleIndex.count)
        roundBattlesIndex.append(battleIndex[randomNum])
        battleIndex.remove(at: randomNum)
    }
        
    var i = 0
    
    while i < roundBattlesIndex.count {
        roundBattles.append(allBattles[roundBattlesIndex[i]])
        i += 1
    }
    
    return roundBattles
}





