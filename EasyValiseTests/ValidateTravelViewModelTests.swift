//
//  ValidateTravelViewModelTests.swift
//  EasyValiseTests
//
//  Created by Richard Sourianarayanane on 11/06/2023.
//

import XCTest
@testable import EasyValise

final class ValidateTravelViewModelTests: XCTestCase {

    func testSaveInCoreDataSouldBeOK() {
        //Given
        let testCoreDataStack = TestCoreDataStack()
        let easyValiseRepository = EasyValiseRepository(coreDataStack: testCoreDataStack)
        let validateTravelViewModel = ValidateTravelViewModel(travelName: EasyValiseMocks.travelNameMock, travelDate: EasyValiseMocks.dateMock, suitcaseModelName: "valise modele", items: EasyValiseMocks.listItemsMock, easyValiseRepository: easyValiseRepository)
        
        // When
        validateTravelViewModel.saveInCoreData { success in
            guard success else {
                return XCTAssertFalse(success)
            }
        }
        
        // Then
        easyValiseRepository.getAllTravel { success, travels in
            if success {
                XCTAssertEqual(travels.first?.name, EasyValiseMocks.travelNameMock)
                XCTAssertEqual(travels.first?.date, EasyValiseMocks.dateMock)
                guard let items = travels.first?.suitcase.items else {return}
                let itemsOrdered = items.sorted {$0.name > $1.name }
                let itemsMockedOrdered = EasyValiseMocks.listItemsMock.sorted {$0.name > $1.name }
                for (index, item) in itemsOrdered.enumerated() {
                    XCTAssertEqual(item.name, itemsMockedOrdered[index].name)
                    XCTAssertEqual(item.section, itemsMockedOrdered[index].section)
                    XCTAssertEqual(item.isChecked, itemsMockedOrdered[index].isChecked)
                }
            } else {
                XCTFail("fail get recipes")
            }
        }
        
    }

    func testSaveInCoreDataSouldBeNotOK() {
        //Given
        let testCoreDataStack = TestCoreDataStackKO()
        let easyValiseRepository = EasyValiseRepository(coreDataStack: testCoreDataStack)
        let validateTravelViewModel = ValidateTravelViewModel(travelName: EasyValiseMocks.travelNameMock, travelDate: EasyValiseMocks.dateMock, suitcaseModelName: "valise modele", items: EasyValiseMocks.listItemsMock, easyValiseRepository: easyValiseRepository)
        
        // When
        validateTravelViewModel.saveInCoreData { success in
            // Then
            XCTAssertFalse(success)
        }
    }
    
    func testSectionsToShow() {
        //Given & When
        let validateTravelViewModel = ValidateTravelViewModel(travelName: EasyValiseMocks.travelNameMock, travelDate: EasyValiseMocks.dateMock, suitcaseModelName: "valise modele", items: EasyValiseMocks.listItemsMock)
        
        //Then
        XCTAssertEqual(validateTravelViewModel.sectionsName[0], Section.accessories.rawValue)
        XCTAssertEqual(validateTravelViewModel.sectionsName[1], Section.toiletItems.rawValue)
        XCTAssertEqual(validateTravelViewModel.sectionsName[2], Section.clothes.rawValue)
    }
    
    func testAddNewItem() {
        let itemName = "Jeans"
        
        let validateTravelViewModel = ValidateTravelViewModel(travelName: EasyValiseMocks.travelNameMock, travelDate: EasyValiseMocks.dateMock, suitcaseModelName: "valise modele", items: EasyValiseMocks.listItemsMock)
        
        validateTravelViewModel.addNewItem(itemName: itemName, sectionName: Section.clothes.rawValue) { success in
            XCTAssertEqual(validateTravelViewModel.items.last?.name, "Jeans")
        }
    }
    
    func testDeleteItem() {
        let itemName = "Jeans"
        
        let validateTravelViewModel = ValidateTravelViewModel(travelName: EasyValiseMocks.travelNameMock, travelDate: EasyValiseMocks.dateMock, suitcaseModelName: "valise modele", items: EasyValiseMocks.listItemsMock)
        
        validateTravelViewModel.deleteItem(item: EasyValiseMocks.itemClothes1) { success in
            XCTAssertFalse(validateTravelViewModel.items.contains(where: {$0 == EasyValiseMocks.itemClothes1}))
        }
    }
}
