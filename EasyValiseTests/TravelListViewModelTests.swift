//
//  TravelListViewModelTests.swift
//  EasyValiseTests
//
//  Created by Richard Sourianarayanane on 12/06/2023.
//

import XCTest
@testable import EasyValise

final class TravelListViewModelTests: XCTestCase {

    func testSectionUsed() {
        //Given & When
        let travelListViewModel = TravelListViewModel(travel: EasyValiseMocks.travelMock)
        
        //Then
        XCTAssertEqual(travelListViewModel.sectionsName[0], Section.accessories.rawValue)
        XCTAssertEqual(travelListViewModel.sectionsName[1], Section.toiletItems.rawValue)
        XCTAssertEqual(travelListViewModel.sectionsName[2], Section.clothes.rawValue)
    }
    
    func testGetItem() {
        //Given
        let travelListViewModel = TravelListViewModel(travel: EasyValiseMocks.travelMock)
        
        // When
        let item1 = travelListViewModel.getItem(indexpathSection: 0, indexpathRow: 1)
        let item2 = travelListViewModel.getItem(indexpathSection: 1, indexpathRow: 1)
        let item3 = travelListViewModel.getItem(indexpathSection: 1, indexpathRow: 2)
        let item4 = travelListViewModel.getItem(indexpathSection: 2, indexpathRow: 0)
       
        // Then
        XCTAssertEqual(item1.name, "Sac à main")
        XCTAssertEqual(item2.name, "Dentifrice")
        XCTAssertEqual(item3.name, "Savon")
        XCTAssertEqual(item4.name, "Shorts")
    }
    
    func testUpdateIsCheckedIsOK() {
        //Given
        let coreDataStack = TestCoreDataStack()
        let easyValiseRepository = EasyValiseRepository(coreDataStack: coreDataStack)
        let travelListViewModel = TravelListViewModel(travel: EasyValiseMocks.travelMock, easyValiseRepository: easyValiseRepository)
        easyValiseRepository.save(travel: EasyValiseMocks.travelMock) { success in
            if !success {
                XCTFail("Erreur")
            }
        }
        
        // When
        travelListViewModel.updateIsChecked(for: EasyValiseMocks.travelMock, item: EasyValiseMocks.travelMock.suitcase.items.first!, isChecked: true) { success in
            XCTAssertEqual(success, true)
        }
    }
    
    func testUpdateIsCheckedIsKO() {
        //Given
        let coreDataStack = TestCoreDataStackKO()
        let easyValiseRepository = EasyValiseRepository(coreDataStack: coreDataStack)
        let travelListViewModel = TravelListViewModel(travel: EasyValiseMocks.travelMock, easyValiseRepository: easyValiseRepository)
        
        // When
        travelListViewModel.updateIsChecked(for: EasyValiseMocks.travelMock, item: EasyValiseMocks.travelMock.suitcase.items.first!, isChecked: true) { success in
            XCTAssertEqual(success, false)
        }
    }
}


