//
//  MovieDetailViewModelTests.swift
//  CaseMovieTests
//
//  Created by Winlentia on 13.08.2022.
//

import XCTest

class MovieDetailViewModelTests: XCTestCase {
    
    let viewModel = MovieDetailViewModel(movieId: 361743, service: MovieMockService())

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testNavigationTitle() throws {
        XCTAssertEqual(viewModel.navigationTitle, "Top Gun: Maverick")
    }
    
    func testSubtitle() throws {
        XCTAssertEqual(viewModel.subTitle, "2022 | 2h 11m | Action, Drama")
    }
    
    func testTitle() throws {
        XCTAssertEqual(viewModel.title, "Top Gun: Maverick")
    }
    
    func testDescription() throws {
        XCTAssertEqual(viewModel.description, "After more than thirty years of service as one of the Navy’s top aviators, and dodging the advancement in rank that would ground him, Pete “Maverick” Mitchell finds himself training a detachment of TOP GUN graduates for a specialized mission the likes of which no living pilot has ever seen.")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
