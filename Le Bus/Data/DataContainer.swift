//
//  DataContainer.swift
//  Le Bus
//
//  Created by Vincent Creton on 06/04/2021.
//

import Foundation

/**
 * Implémentation simple d'un singleton.
 *
 * L'instance est créée à l'initialisation.
 *
 * Ce singleton va nous permettre de stocké des datas éphémères raccordé à la partie en cours
 */
public class DataContainer {
    public static let sharedInstance = DataContainer()
    var cardsNumber: Int?

    private init() {
    // L'initialisation est privé pour être sur qu'une seule instance sera créé
    }
}
