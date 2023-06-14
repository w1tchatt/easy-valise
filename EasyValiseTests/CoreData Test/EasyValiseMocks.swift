//
//  EasyValiseMocks.swift.swift
//  EasyValiseTests
//
//  Created by Richard Sourianarayanane on 11/06/2023.
//

import Foundation
@testable import EasyValise

final class EasyValiseMocks {
    static let itemClothes1 = Item(name: "Tshirt", isChecked: false, section: Section.clothes.rawValue)
    static let itemClothes2 = Item(name: "Pantalons", isChecked: false, section: Section.clothes.rawValue)
    static let itemClothes3 = Item(name: "Shorts", isChecked: false, section: Section.clothes.rawValue)
    
    static let itemToiletry1 = Item(name: "Brosse à dent", isChecked: false, section: Section.toiletItems.rawValue)
    static let itemToiletry2 = Item(name: "Dentifrice", isChecked: false, section: Section.toiletItems.rawValue)
    static let itemToiletry3 = Item(name: "Savon", isChecked: false, section: Section.toiletItems.rawValue)
    
    static let itemAccessory1 = Item(name: "Sac à main", isChecked: false, section: Section.accessories.rawValue)
    static let itemAccessory2 = Item(name: "Sac à dos", isChecked: false, section: Section.accessories.rawValue)
    
    
    static let listItemsMock: [Item] = [
        itemClothes1, itemClothes3, itemToiletry1, itemToiletry2, itemToiletry3, itemAccessory1, itemAccessory2
    ]
    
    static let listItemsMock2: [Item] = [
        itemClothes1, itemToiletry1, itemAccessory2
    ]
    
    static let suitcaseMock: Suitcase = Suitcase(items: EasyValiseMocks.listItemsMock)
    static let suitcaseMock2: Suitcase = Suitcase(items: EasyValiseMocks.listItemsMock2)
    
    // 11/06/2023 16:30:00
    static let dateMock = Date(timeIntervalSince1970: 1686493800)
    static let dateMock2 = Date(timeIntervalSince1970: 1686393800)
    
    
    static let travelNameMock = "Paris"
    static let travelNameMock2 = "New York"    
    
    static let travelMock = Travel(name: EasyValiseMocks.travelNameMock, date: EasyValiseMocks.dateMock, suitcase: EasyValiseMocks.suitcaseMock)
    static let travelMock2 = Travel(name: EasyValiseMocks.travelNameMock2, date: EasyValiseMocks.dateMock2, suitcase: EasyValiseMocks.suitcaseMock2)
    
}
