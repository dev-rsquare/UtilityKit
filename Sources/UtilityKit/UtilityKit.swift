import Foundation

extension String {
    
    public enum checktype {
        case english
        case number
        case count
        case none
    }
    
    /**
     이메일 입력
     공백입력시 제외처리
     /**
      이메일 입력
      공백입력시 제외처리
      *@*.* 형식체크
      */
     *@*.* 형식체크
     */
    
    public func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,20}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    
    /**
     비밀번호 입력
     영문,숫자,특수문자입력으로 8자 이상입력, 대소문자구분
     */
    
    public func contains(_ type: checktype = .none) -> Bool{
        var regex = #"^(?=.*[0-9])(?=.*[a-zA-z])([a-zA-Z0-9,<.>/?;:’“\[{\]}`~!@#$%^&*()-_=+]{8,20})$"#
        let passwordtesting = NSPredicate(format: "SELF MATCHES %@", regex)
        if  !passwordtesting.evaluate(with: self){
            switch type {
            case .english:
                regex = #"^(?=.*[a-zA-Z])([a-zA-Z0-9,<.>/?;:’“\[{\]}`~!@#$%^&*()-_=+]{0,})$"#
            case .number:
                regex = #"^(?=.*[0-9])([a-zA-Z0-9,<.>/?;:’“\[{\]}`~!@#$%^&*()-_=+]{0,})$"#
            case .count:
                return self.count >= 8
            default:
                break
            }
            let passwordtesting = NSPredicate(format: "SELF MATCHES %@", regex)
            return passwordtesting.evaluate(with: self)
        }else{
            return passwordtesting.evaluate(with: self)
        }
    }
}
