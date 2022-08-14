//
//  MainViewModelTests.swift
//  CaseMovieTests
//
//  Created by Winlentia on 14.08.2022.
//

import XCTest

class MainViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testViewModelVariables() throws {
        let viewModel = MainViewModel(movieService: MovieMockService(), searchService: SearchMockService())
        
        XCTAssertFalse(viewModel.isSearchActive)
        viewModel.fetchMovies()
        XCTAssertEqual(viewModel.numberOfSections(), 1)
        XCTAssertEqual(viewModel.numberOfRowsInSection(section: 0), 20)
       
        viewModel.search(query: "harry po")
        XCTAssertTrue(viewModel.isSearchActive)
        XCTAssertEqual(viewModel.searchQuery, "harry+po")
        XCTAssertEqual(viewModel.numberOfSections(), 2)
        XCTAssertEqual(viewModel.numberOfRowsInSection(section: 0), 20)
        XCTAssertEqual(viewModel.numberOfRowsInSection(section: 1), 20)
        
        
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
