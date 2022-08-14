//
//  PopularMovieTableViewModel.swift
//  CaseMovieTests
//
//  Created by Winlentia on 14.08.2022.
//

import XCTest

class PopularMovieTableViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testSample() throws {
        
    }
    
    func testViewModelVariables() throws {
        let mainViewModel = MainViewModel(movieService: MovieMockService(), searchService: SearchMockService())
        
        mainViewModel.fetchMovies()
        let viewModel = PopularMovieTableViewModel(movie: mainViewModel.popularMovieData[0])
        XCTAssertEqual(viewModel.title, "Prey")
        XCTAssertEqual(viewModel.releaseDate, "Release Date: 2022")
        XCTAssertNotNil(viewModel.imageUrl)
        XCTAssertEqual(viewModel.imageUrl, "https://image.tmdb.org/t/p/w200/ujr5pztc1oitbe7ViMUOilFaJ7s.jpg")
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
