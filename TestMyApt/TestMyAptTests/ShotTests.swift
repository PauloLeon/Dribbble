//
//  ShotTests.swift
//  TestMyApt
//
//  Created by Paulo Rosa on 01/09/17.
//  Copyright © 2017 Paulo Rosa. All rights reserved.
//

import XCTest
@testable import TestMyApt

class ShotTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func arrayForPlist() -> Array<Any> {
        let bundle = Bundle(for: ShotTests.self)
        let path = bundle.path(forResource: "test_shots", ofType: "plist")!
        return NSArray(contentsOfFile: path) as! [[String : Any]]
    }
    
    // MARK: - Formatting dates
    func testFormatDate() {
        
        // given
        
        //success
        let date:String = "2017-09-01T15:06:37Z"
        
        // fail
        //let date:String = "01-01-2012"

        // when
        let stringDate: String = ShotViewModel.formatterDate(createdAt: date)
        
        // then
        XCTAssertNotEqual(stringDate, "Data não reconhecida")
    }
    
    func testShotInitialize() {
        // given
        
        //sucess
        let shot = Shots(fromArray: arrayForPlist(), indexOfPlist: 0)

        //fail
        //let array: Array = ["any","array","of","response"]
        //let shot = Shots(fromArray: array, indexOfPlist: 0)
        
        
        // when // then
        XCTAssert(shot.id != "")
        XCTAssert(shot.title != "")
        XCTAssert(shot.commentsCount != "")
        XCTAssert(shot.viewsCount != "")
        XCTAssert(shot.createdAt != "")
        XCTAssert(shot.desc != "")
        XCTAssert(shot.image != "")
    }
    
    func testShotViewModel() {
        // given
        
        //sucess
        let shot = Shots(fromArray: arrayForPlist(), indexOfPlist: 0)
        
        //fail
        //let array: Array = ["any","array","of","response"]
        //let shot = Shots(fromArray: array, indexOfPlist: 0)
        
        
        // when
        let shotViewModel = ShotViewModel(shot: shot)
        
        // then
        XCTAssert(shotViewModel.title != "")
        XCTAssert(shotViewModel.countComment != "")
        XCTAssert(shotViewModel.countViews != "")
        XCTAssert(shotViewModel.createdAt != "")
        XCTAssert(shotViewModel.desc != "")
        
        XCTAssert(shotViewModel.image?.absoluteString != "")
        
    }
}
