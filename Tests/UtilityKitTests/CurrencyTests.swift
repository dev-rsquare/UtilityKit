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
        XCTAssertEqual("".spelloutCurrency(suffix: .unit, defaultValue: "0"), "0원")
        XCTAssertEqual("".spelloutCurrency(defaultValue: "1"), "1원")
        XCTAssertEqual("".spelloutCurrency(defaultValue: "-"), "-원")
        XCTAssertEqual("".spelloutCurrency(defaultValue: ""), "")
    }
    
    func test_단위변환해서_반환되는지() throws {
        XCTAssertEqual(0.55.toDisplay(), "5,500")
        XCTAssertEqual(0.051.toDisplay(), "510")
        XCTAssertEqual(0.071.toDisplay(), "710")
        XCTAssertEqual(0.011.toDisplay(), "110")
        XCTAssertEqual(0.043.toDisplay(), "430")
        XCTAssertEqual(0.08.toDisplay(), "800")
        XCTAssertEqual(0.081.toDisplay(), "810")
        XCTAssertEqual(0.082.toDisplay(), "820")
        XCTAssertEqual(0.083.toDisplay(), "830")
        XCTAssertEqual(0.084.toDisplay(), "840")
        XCTAssertEqual(0.085.toDisplay(), "850")
        XCTAssertEqual(0.086.toDisplay(), "860")
        XCTAssertEqual(0.087.toDisplay(), "870")
        XCTAssertEqual(0.088.toDisplay(), "880")
        XCTAssertEqual(0.089.toDisplay(), "890")
        XCTAssertEqual(1.009.toDisplay(), "1만 90")
        XCTAssertEqual(0.444.toDisplay(), "4,440")
        
        XCTAssertEqual(777777777777.toDisplay(), "7,777조 7,777억 7,777만")
        XCTAssertEqual(111111111111.toDisplay(), "1,111조 1,111억 1,111만")
        XCTAssertEqual(999999999999.toDisplay(), "9,999조 9,999억 9,999만")
    }
    
    func test_suffix_원단위변환해서_반환되는지() throws {
        XCTAssertEqual(0.55.toDisplay(suffix: .unit), "5,500원")
        XCTAssertEqual(0.051.toDisplay(suffix: .unit), "510원")
        XCTAssertEqual(0.071.toDisplay(suffix: .unit), "710원")
        XCTAssertEqual(0.011.toDisplay(suffix: .unit), "110원")
        XCTAssertEqual(0.043.toDisplay(suffix: .unit), "430원")
        XCTAssertEqual(0.08.toDisplay(suffix: .unit), "800원")
        XCTAssertEqual(0.081.toDisplay(suffix: .unit), "810원")
        XCTAssertEqual(0.082.toDisplay(suffix: .unit), "820원")
        XCTAssertEqual(0.083.toDisplay(suffix: .unit), "830원")
        XCTAssertEqual(0.084.toDisplay(suffix: .unit), "840원")
        XCTAssertEqual(0.085.toDisplay(suffix: .unit), "850원")
        XCTAssertEqual(0.086.toDisplay(suffix: .unit), "860원")
        XCTAssertEqual(0.087.toDisplay(suffix: .unit), "870원")
        XCTAssertEqual(0.088.toDisplay(suffix: .unit), "880원")
        XCTAssertEqual(0.089.toDisplay(suffix: .unit), "890원")
        XCTAssertEqual(1.009.toDisplay(suffix: .unit), "1만 90원")
        XCTAssertEqual(0.444.toDisplay(suffix: .unit), "4,440원")
        
        XCTAssertEqual(777777777777.toDisplay(suffix: .unit), "7,777조 7,777억 7,777만원")
        XCTAssertEqual(111111111111.toDisplay(suffix: .unit), "1,111조 1,111억 1,111만원")
        XCTAssertEqual(999999999999.toDisplay(suffix: .unit), "9,999조 9,999억 9,999만원")
    }
    
    func test_문자열에서_단위변환해서_반환되는지() throws {
        XCTAssertEqual("5500".spelloutCurrency(), "5,500만")
        XCTAssertEqual("510".spelloutCurrency(), "510만")
        XCTAssertEqual("710".spelloutCurrency(), "710만")
        XCTAssertEqual("110".spelloutCurrency(), "110만")
        XCTAssertEqual("430".spelloutCurrency(), "430만")
        XCTAssertEqual("800".spelloutCurrency(), "800만")
        XCTAssertEqual("810".spelloutCurrency(), "810만")
        XCTAssertEqual("820".spelloutCurrency(), "820만")
        XCTAssertEqual("830".spelloutCurrency(), "830만")
        XCTAssertEqual("840".spelloutCurrency(), "840만")
        XCTAssertEqual("850".spelloutCurrency(), "850만")
        XCTAssertEqual("860".spelloutCurrency(), "860만")
        XCTAssertEqual("870".spelloutCurrency(), "870만")
        XCTAssertEqual("880".spelloutCurrency(), "880만")
        XCTAssertEqual("890".spelloutCurrency(), "890만")
        XCTAssertEqual("10090".spelloutCurrency(), "1억 90만")
        XCTAssertEqual("4440".spelloutCurrency(), "4,440만")
        
        XCTAssertEqual("777777777777".spelloutCurrency(), "7,777조 7,777억 7,777만")
        XCTAssertEqual("111111111111".spelloutCurrency(), "1,111조 1,111억 1,111만")
        XCTAssertEqual("999999999999".spelloutCurrency(), "9,999조 9,999억 9,999만")
    }
    
    func test_문자열에서_접미사_원단위변환해서_반환되는지() throws {
        XCTAssertEqual("5500".spelloutCurrency(suffix: .unit), "5,500만원")
        XCTAssertEqual("510".spelloutCurrency(suffix: .unit), "510만원")
        XCTAssertEqual("710".spelloutCurrency(suffix: .unit), "710만원")
        XCTAssertEqual("110".spelloutCurrency(suffix: .unit), "110만원")
        XCTAssertEqual("430".spelloutCurrency(suffix: .unit), "430만원")
        XCTAssertEqual("800".spelloutCurrency(suffix: .unit), "800만원")
        XCTAssertEqual("810".spelloutCurrency(suffix: .unit), "810만원")
        XCTAssertEqual("820".spelloutCurrency(suffix: .unit), "820만원")
        XCTAssertEqual("830".spelloutCurrency(suffix: .unit), "830만원")
        XCTAssertEqual("840".spelloutCurrency(suffix: .unit), "840만원")
        XCTAssertEqual("850".spelloutCurrency(suffix: .unit), "850만원")
        XCTAssertEqual("860".spelloutCurrency(suffix: .unit), "860만원")
        XCTAssertEqual("870".spelloutCurrency(suffix: .unit), "870만원")
        XCTAssertEqual("880".spelloutCurrency(suffix: .unit), "880만원")
        XCTAssertEqual("890".spelloutCurrency(suffix: .unit), "890만원")
        XCTAssertEqual("10090".spelloutCurrency(suffix: .unit), "1억 90만원")
        XCTAssertEqual("4440".spelloutCurrency(suffix: .unit), "4,440만원")
        
        XCTAssertEqual("777777777777".spelloutCurrency(suffix: .unit), "7,777조 7,777억 7,777만원")
        XCTAssertEqual("111111111111".spelloutCurrency(suffix: .unit), "1,111조 1,111억 1,111만원")
        XCTAssertEqual("999999999999".spelloutCurrency(suffix: .unit), "9,999조 9,999억 9,999만원")
    }
    
    func test_문자열에서_단위변환해서_원단위로_반환되는지() throws {
        XCTAssertEqual("5500".spelloutCurrency(smallestUnit: .unit), "5,500")
        XCTAssertEqual("510".spelloutCurrency(smallestUnit: .unit), "510")
        XCTAssertEqual("710".spelloutCurrency(smallestUnit: .unit), "710")
        XCTAssertEqual("110".spelloutCurrency(smallestUnit: .unit), "110")
        XCTAssertEqual("430".spelloutCurrency(smallestUnit: .unit), "430")
        XCTAssertEqual("800".spelloutCurrency(smallestUnit: .unit), "800")
        XCTAssertEqual("810".spelloutCurrency(smallestUnit: .unit), "810")
        XCTAssertEqual("820".spelloutCurrency(smallestUnit: .unit), "820")
        XCTAssertEqual("830".spelloutCurrency(smallestUnit: .unit), "830")
        XCTAssertEqual("840".spelloutCurrency(smallestUnit: .unit), "840")
        XCTAssertEqual("850".spelloutCurrency(smallestUnit: .unit), "850")
        XCTAssertEqual("860".spelloutCurrency(smallestUnit: .unit), "860")
        XCTAssertEqual("870".spelloutCurrency(smallestUnit: .unit), "870")
        XCTAssertEqual("880".spelloutCurrency(smallestUnit: .unit), "880")
        XCTAssertEqual("890".spelloutCurrency(smallestUnit: .unit), "890")
        XCTAssertEqual("10090".spelloutCurrency(smallestUnit: .unit), "1만 90")
        XCTAssertEqual("4440".spelloutCurrency(smallestUnit: .unit), "4,440")
        
        XCTAssertEqual("777777777777".spelloutCurrency(), "7,777조 7,777억 7,777만")
        XCTAssertEqual("111111111111".spelloutCurrency(), "1,111조 1,111억 1,111만")
        XCTAssertEqual("999999999999".spelloutCurrency(), "9,999조 9,999억 9,999만")
    }

    
    func test_문자열에서_suffix_원단위변환해서_원단위로_반환되는지() throws {
        XCTAssertEqual("5500".spelloutCurrency(smallestUnit: .unit ,suffix: .unit), "5,500원")
        XCTAssertEqual("510".spelloutCurrency(smallestUnit: .unit ,suffix: .unit), "510원")
        XCTAssertEqual("710".spelloutCurrency(smallestUnit: .unit ,suffix: .unit), "710원")
        XCTAssertEqual("110".spelloutCurrency(smallestUnit: .unit ,suffix: .unit), "110원")
        XCTAssertEqual("430".spelloutCurrency(smallestUnit: .unit ,suffix: .unit), "430원")
        XCTAssertEqual("800".spelloutCurrency(smallestUnit: .unit ,suffix: .unit), "800원")
        XCTAssertEqual("810".spelloutCurrency(smallestUnit: .unit ,suffix: .unit), "810원")
        XCTAssertEqual("820".spelloutCurrency(smallestUnit: .unit ,suffix: .unit), "820원")
        XCTAssertEqual("830".spelloutCurrency(smallestUnit: .unit ,suffix: .unit), "830원")
        XCTAssertEqual("840".spelloutCurrency(smallestUnit: .unit ,suffix: .unit), "840원")
        XCTAssertEqual("850".spelloutCurrency(smallestUnit: .unit ,suffix: .unit), "850원")
        XCTAssertEqual("860".spelloutCurrency(smallestUnit: .unit ,suffix: .unit), "860원")
        XCTAssertEqual("870".spelloutCurrency(smallestUnit: .unit ,suffix: .unit), "870원")
        XCTAssertEqual("880".spelloutCurrency(smallestUnit: .unit ,suffix: .unit), "880원")
        XCTAssertEqual("890".spelloutCurrency(smallestUnit: .unit ,suffix: .unit), "890원")
        XCTAssertEqual("10090".spelloutCurrency(smallestUnit: .unit ,suffix: .unit), "1만 90원")
        XCTAssertEqual("4440".spelloutCurrency(smallestUnit: .unit ,suffix: .unit), "4,440원")
        
        XCTAssertEqual("777777777777".spelloutCurrency(suffix: .unit), "7,777조 7,777억 7,777만원")
        XCTAssertEqual("111111111111".spelloutCurrency(suffix: .unit), "1,111조 1,111억 1,111만원")
        XCTAssertEqual("999999999999".spelloutCurrency(suffix: .unit), "9,999조 9,999억 9,999만원")
    }

}
