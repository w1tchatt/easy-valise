//
//  CreateTravelViewModelTests.swift
//  EasyValiseTests
//
//  Created by Richard Sourianarayanane on 11/06/2023.
//

import XCTest
@testable import EasyValise

final class CreateTravelViewModelTests: XCTestCase {

    func testGetDateIsOK() {
        // Given
        let createTravelViewModel = CreateTravelViewModel()
        
        // When
        createTravelViewModel.setDate(date: EasyValiseMocks.dateMock)
        
        // Then
        createTravelViewModel.travelDate = EasyValiseMocks.dateMock
    }
    
    func testtextFieldIsNotEmpty() {
        // Given
        let createTravelViewModel = CreateTravelViewModel()
        
        // When
        let test = createTravelViewModel.textFieldIsEmpty(text: "test de test")
        
        // Then
        XCTAssertEqual(test, false)
    }
    
    func testtextFieldIsEmpty() {
        // Given
        let createTravelViewModel = CreateTravelViewModel()
        
        // When
        let test = createTravelViewModel.textFieldIsEmpty(text: " ")
        
        // Then
        XCTAssertEqual(test, true)
    }

}



//            func setDate(date:Date) {
//                self.travelDate = date
//            }
//            
//            func textFieldIsEmpty(text: String?) -> Bool {
//                guard let textUnwrap = text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return true }
//                    if textUnwrap.isEmpty {
//                        return true
//                    } else {
//                    return false
//                }
