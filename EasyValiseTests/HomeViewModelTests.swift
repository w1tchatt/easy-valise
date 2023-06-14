//
//  HomeViewModelTests.swift
//  EasyValiseTests
//
//  Created by Richard Sourianarayanane on 11/06/2023.
//

import XCTest
@testable import EasyValise

final class HomeViewModelTests: XCTestCase {
    
    func testGetAllTravelsIsOK() {
        // Given
        let testCoreDataStack = TestCoreDataStack()
        let easyValiseRepository = EasyValiseRepository(coreDataStack: testCoreDataStack)
        let homeViewModel = HomeViewModel(easyValiseRepository: easyValiseRepository)
        
        easyValiseRepository.save(travel: EasyValiseMocks.travelMock) { success in
            if !success {
                XCTFail("Erreur")
            }
        }
        easyValiseRepository.save(travel: EasyValiseMocks.travelMock2) { success in
            if !success {
                XCTFail("Erreur")
            }
        }
        
        // When
        homeViewModel.getTravels { success in
            if success {
                XCTAssertEqual(homeViewModel.travels.count, 2)
                XCTAssertEqual(homeViewModel.travels[0].name, EasyValiseMocks.travelNameMock)
                XCTAssertEqual(homeViewModel.travels[0].date, EasyValiseMocks.dateMock)
                XCTAssertEqual(homeViewModel.travels[0].suitcase.items.count, EasyValiseMocks.listItemsMock.count)
                
                XCTAssertEqual(homeViewModel.travels[1].name, EasyValiseMocks.travelNameMock2)
                XCTAssertEqual(homeViewModel.travels[1].date, EasyValiseMocks.dateMock2)
                XCTAssertEqual(homeViewModel.travels[1].suitcase.items.count, EasyValiseMocks.listItemsMock2.count)
            }
        }
    }
    
    func testGetAllTravelsFail() {
        // Given
        let testCoreDataStack = TestCoreDataStackKO()
        let easyValiseRepository = EasyValiseRepository(coreDataStack: testCoreDataStack)
        let homeViewModel = HomeViewModel(easyValiseRepository: easyValiseRepository)
        
        // When
        homeViewModel.getTravels { success in
            XCTAssertEqual(success, false)
        }
    }
    
    func testDateformatted() {
        // Given
        let homeViewModel = HomeViewModel()
        
        // When
        let date = homeViewModel.dateFormatted(date: EasyValiseMocks.dateMock)
        
        // Then
        XCTAssertEqual(date, "11/06/2023")
        
    }
}
