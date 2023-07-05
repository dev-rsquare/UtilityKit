import XCTest
@testable import UtilityKit

final class UtilityKitTests: XCTestCase {
    
    
    func test_이메일_유효성검사_성공(){
        // given
        let userEmail = "atlas1234@gmail.com"
        // when
        let isValidExpression = userEmail.isValidEmail()
        print(isValidExpression)
        // then
        XCTAssertTrue(isValidExpression)
    }
    
    func test_이메일_유효성검사_실패(){
        // given
        let userEmail = "atlas1234gmail.com"
        // when
        let isValidExpression = userEmail.isValidEmail()
        
        // then
        XCTAssertFalse(isValidExpression)
    }
    
    func test_문자열이_이메일_유효성검사_잘반환되는지() throws {
        
        XCTAssertTrue("zz@zz.zz".isValidEmail())
        
        XCTAssertFalse("zzzz.zz".isValidEmail())
        XCTAssertFalse("zz@zzzz".isValidEmail())
        
    }
    
    func test_문자열이_비밀번호_유효성검사_잘반환되는지() throws {
        XCTAssertTrue("zzss11!z11".contains())
        XCTAssertFalse("한글은안돼요".contains())
        XCTAssertFalse("🔥🔥🔥".contains())
        XCTAssertTrue("|zzzz1111".contains())
        XCTAssertTrue("'zzzz1111".contains())
        XCTAssertFalse("¥zzzz1111".contains())
        XCTAssertFalse("£zzzz1111".contains())
        XCTAssertFalse("€zzzz1111".contains())
        XCTAssertTrue("$zzzz1111".contains())
        XCTAssertTrue("₩zzzz1111".contains())
        XCTAssertFalse("•zzzz1111".contains())
        XCTAssertTrue("\\zzzz1111".contains())
        XCTAssertFalse("\\₩$€£¥'•|zzzz1111".contains())
        
        XCTAssertTrue("zzzz1111".contains())
        XCTAssertTrue("zzzz1111!@#$%^&*()-".contains())
        XCTAssertTrue("zzzz1111\\".contains())
        XCTAssertTrue("1234aaaa.,~`;:/'\"-_".contains())
        XCTAssertTrue("1234aaaa+\\|".contains())
        

    }
    
    func test_문자열에_영어가_포함되어있는지() throws {
        XCTAssertTrue("aa".contains(.english))
        XCTAssertFalse("11".contains(.english))
    }
    
    func test_문자열에_숫자가_포함되어있는지() throws {
        XCTAssertTrue("11".contains(.number))
        XCTAssertFalse("zz".contains(.number))
    }
    
    func test_문자열이_8글자_이상인지() throws {
        XCTAssertTrue("aaaa1111".contains(.english))
        XCTAssertFalse("1111".contains(.english))
    }
    
}
