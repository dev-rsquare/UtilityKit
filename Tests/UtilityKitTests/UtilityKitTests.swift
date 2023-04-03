import XCTest
@testable import UtilityKit

final class UtilityKitTests: XCTestCase {
    func test_문자열이_이메일_유효성검사_잘반환되는지() throws {
        
        XCTAssertTrue("zz@zz.zz".isValidEmail())
        
        XCTAssertFalse("zzzz.zz".isValidEmail())
        XCTAssertFalse("zz@zzzz".isValidEmail())
        
    }
    
    func test_문자열이_비밀번호_유효성검사_잘반환되는지() throws {
        XCTAssertTrue("zzss11!z11".contains())
        XCTAssertFalse("한글은안돼요".contains())
        XCTAssertFalse("🔥🔥🔥".contains())
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
