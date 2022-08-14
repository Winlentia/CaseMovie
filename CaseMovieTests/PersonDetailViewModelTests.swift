//
//  PersonDetailViewModelTests.swift
//  CaseMovieTests
//
//  Created by Winlentia on 14.08.2022.
//

import XCTest

class PersonDetailViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testViewModelVariables() throws {
        let viewModel = PersonDetailViewModel(personId: 117640, service: PersonMockService())
        XCTAssertEqual(117640, viewModel.personId)
        XCTAssertEqual(viewModel.navigationTitle, "Haluk Bilginer")
        XCTAssertEqual(viewModel.subTitle, "Born 06 Jun 1954")
        XCTAssertEqual(viewModel.profileImageUrl, "https://image.tmdb.org/t/p/w500/gOrSNwrctPP6k23GnP3np7wvjOR.jpg")
        XCTAssertEqual(viewModel.title, "Haluk Bilginer")
        XCTAssertEqual(viewModel.biography, "Nihat Haluk Bilginer is a Turkish actor. In addition to his acting career in Turkey, he has also worked in the United Kingdom and remains best known for his role as Mehmet Osman in the television soap opera EastEnders during the 1980s. He has also starred in Hollywood movies as a minor actor. He has won a Palme d\'Or for his performance in Winter Sleep in 2014, and an Emmy for his performance in Şahsiyet in 2018.")
        XCTAssertEqual(viewModel.isImdbButtonHidden, false)
        XCTAssertEqual(viewModel.imdbUrl, "https://www.imdb.com/name/nm0082211/")
        
        
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
