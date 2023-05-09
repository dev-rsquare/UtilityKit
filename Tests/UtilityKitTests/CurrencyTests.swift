//
//  CurrencyTests.swift
//  
//
//  Created by Dongju on 2023/04/06.
//

import XCTest

final class CurrencyTests: XCTestCase {

    func test_suffix_값지정에따라_단위변환값이_반환되는지(){
        XCTAssertEqual("5500".spelloutCurrency(suffix: .none, defaultValue: "0"), "5,500만")
        XCTAssertEqual("5500".spelloutCurrency(defaultValue: "0"), "5,500만")
        
        XCTAssertEqual("510".spelloutCurrency(suffix: .unit, defaultValue: "0"), "510만원")
        XCTAssertEqual("510".spelloutCurrency(defaultValue: "0"), "510만")
    }
    
    func test_DefaultValue_값지정에따라_단위변환값이_반환되는지(){
        XCTAssertEqual("".spelloutCurrency(defaultValue: "0"), "0원")
        XCTAssertEqual("".spelloutCurrency(defaultValue: "1"), "1원")
        XCTAssertEqual("".spelloutCurrency(defaultValue: "-"), "-원")
        XCTAssertEqual("".spelloutCurrency(defaultValue: ""), "")
    }
    
    func test_단위변환해서_반환되는지() throws {
        XCTAssertEqual(0.55.toDisplay(), "5,500원")
        XCTAssertEqual(0.051.toDisplay(), "510원")
        XCTAssertEqual(0.071.toDisplay(), "710원")
        XCTAssertEqual(0.011.toDisplay(), "110원")
        XCTAssertEqual(0.043.toDisplay(), "430원")
        XCTAssertEqual(0.08.toDisplay(), "800원")
        XCTAssertEqual(0.081.toDisplay(), "810원")
        XCTAssertEqual(0.082.toDisplay(), "820원")
        XCTAssertEqual(0.083.toDisplay(), "830원")
        XCTAssertEqual(0.084.toDisplay(), "840원")
        XCTAssertEqual(0.085.toDisplay(), "850원")
        XCTAssertEqual(0.086.toDisplay(), "860원")
        XCTAssertEqual(0.087.toDisplay(), "870원")
        XCTAssertEqual(0.088.toDisplay(), "880원")
        XCTAssertEqual(0.089.toDisplay(), "890원")
        XCTAssertEqual(1.009.toDisplay(), "1만 90원")
        XCTAssertEqual(0.444.toDisplay(), "4,440원")
        
        XCTAssertEqual(777777777777.toDisplay(), "7,777조 7,777억 7,777만원")
        XCTAssertEqual(111111111111.toDisplay(), "1,111조 1,111억 1,111만원")
        XCTAssertEqual(999999999999.toDisplay(), "9,999조 9,999억 9,999만원")
    }
    
    func test_문자열에서_단위변환해서_반환되는지() throws {
        XCTAssertEqual("5500".spelloutCurrency(), "5,500만원")
        XCTAssertEqual("510".spelloutCurrency(), "510만원")
        XCTAssertEqual("710".spelloutCurrency(), "710만원")
        XCTAssertEqual("110".spelloutCurrency(), "110만원")
        XCTAssertEqual("430".spelloutCurrency(), "430만원")
        XCTAssertEqual("800".spelloutCurrency(), "800만원")
        XCTAssertEqual("810".spelloutCurrency(), "810만원")
        XCTAssertEqual("820".spelloutCurrency(), "820만원")
        XCTAssertEqual("830".spelloutCurrency(), "830만원")
        XCTAssertEqual("840".spelloutCurrency(), "840만원")
        XCTAssertEqual("850".spelloutCurrency(), "850만원")
        XCTAssertEqual("860".spelloutCurrency(), "860만원")
        XCTAssertEqual("870".spelloutCurrency(), "870만원")
        XCTAssertEqual("880".spelloutCurrency(), "880만원")
        XCTAssertEqual("890".spelloutCurrency(), "890만원")
        XCTAssertEqual("10090".spelloutCurrency(), "1억 90만원")
        XCTAssertEqual("4440".spelloutCurrency(), "4,440만원")
        
        XCTAssertEqual("777777777777".spelloutCurrency(), "7,777조 7,777억 7,777만원")
        XCTAssertEqual("111111111111".spelloutCurrency(), "1,111조 1,111억 1,111만원")
        XCTAssertEqual("999999999999".spelloutCurrency(), "9,999조 9,999억 9,999만원")
    }
    
    func test_문자열에서_단위변환해서_원단위로_반환되는지() throws {
        XCTAssertEqual("5500".spelloutCurrency(smallestUnit: .unit), "5,500원")
        XCTAssertEqual("510".spelloutCurrency(smallestUnit: .unit), "510원")
        XCTAssertEqual("710".spelloutCurrency(smallestUnit: .unit), "710원")
        XCTAssertEqual("110".spelloutCurrency(smallestUnit: .unit), "110원")
        XCTAssertEqual("430".spelloutCurrency(smallestUnit: .unit), "430원")
        XCTAssertEqual("800".spelloutCurrency(smallestUnit: .unit), "800원")
        XCTAssertEqual("810".spelloutCurrency(smallestUnit: .unit), "810원")
        XCTAssertEqual("820".spelloutCurrency(smallestUnit: .unit), "820원")
        XCTAssertEqual("830".spelloutCurrency(smallestUnit: .unit), "830원")
        XCTAssertEqual("840".spelloutCurrency(smallestUnit: .unit), "840원")
        XCTAssertEqual("850".spelloutCurrency(smallestUnit: .unit), "850원")
        XCTAssertEqual("860".spelloutCurrency(smallestUnit: .unit), "860원")
        XCTAssertEqual("870".spelloutCurrency(smallestUnit: .unit), "870원")
        XCTAssertEqual("880".spelloutCurrency(smallestUnit: .unit), "880원")
        XCTAssertEqual("890".spelloutCurrency(smallestUnit: .unit), "890원")
        XCTAssertEqual("10090".spelloutCurrency(smallestUnit: .unit), "1만 90원")
        XCTAssertEqual("4440".spelloutCurrency(smallestUnit: .unit), "4,440원")
        
        XCTAssertEqual("777777777777".spelloutCurrency(), "7,777조 7,777억 7,777만원")
        XCTAssertEqual("111111111111".spelloutCurrency(), "1,111조 1,111억 1,111만원")
        XCTAssertEqual("999999999999".spelloutCurrency(), "9,999조 9,999억 9,999만원")
    }

}
