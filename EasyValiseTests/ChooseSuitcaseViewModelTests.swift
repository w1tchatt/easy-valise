//
//  ChooseSuitcaseViewModelTests.swift
//  EasyValiseTests
//
//  Created by Richard Sourianarayanane on 11/06/2023.
//

import XCTest
@testable import EasyValise

final class ChooseSuitcaseViewModelTests: XCTestCase {

    func testValueOfTravelNameAndTravelDate() {
        // Given and When
        let chooseSuitcaseViewModel = ChooseSuitcaseViewModel(travelName: EasyValiseMocks.travelNameMock, travelDate: EasyValiseMocks.dateMock)
        
        // Then
        XCTAssertEqual(chooseSuitcaseViewModel.travelDate, EasyValiseMocks.dateMock)
        XCTAssertEqual(chooseSuitcaseViewModel.travelName, EasyValiseMocks.travelNameMock)
    }
}

