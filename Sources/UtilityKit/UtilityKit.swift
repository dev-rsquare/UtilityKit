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
    // CREP-3304
    // !@#$%^&*()-_=+<>,./?;:'"[]{}|`~₩
    public func contains(_ type: checktype = .none) -> Bool{
        var regex = #"^(?=.*[0-9])(?=.*[a-zA-z])([a-zA-Z0-9,<.>\/?;:'"\[{\]}`~₩!@#$%^&*()-_=+\\|]{8,20})$"#
        let passwordtesting = NSPredicate(format: "SELF MATCHES %@", regex)
        if  !passwordtesting.evaluate(with: self){
            switch type {
            case .english:
                regex = #"^(?=.*[a-zA-Z])([a-zA-Z0-9,<.>/?;:’“\[{\]}`~!@#$%^&*()-_=+\|'¥£€₩•]{0,})$"#
            case .number:
                regex = #"^(?=.*[0-9])([a-zA-Z0-9,<.>/?;:’“\[{\]}`~!@#$%^&*()-_=+\|'¥£€₩•]{0,})$"#
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
    
    public enum Unit: String {
        case unit = "원"
        case tenThousand = "만"
        case hundredThousand = "억"
        case trilion = "조"
    }

    /**
     number :   변환 스트링
     smallestUnit: 표기 최소 단위
            
     */
    public func spelloutCurrency(smallestUnit: Unit = .tenThousand) -> String {
        
        let templateArray = Array(self)
        var tmpArray: [String] = []
        
        var tempString = ""
        for (index,item) in templateArray.enumerated().reversed() {
            let count = templateArray.count - index
            tempString += "\(item)"
            
            if count % 4 == 0 {
                tmpArray.append(tempString)
                tempString.removeAll()
            }
            
            if count == templateArray.count && !tempString.isEmpty{
                tmpArray.append(tempString)
            }
        }

        let resultArray = tmpArray.enumerated().reduce("") { partialResult, value in
            var unit: Unit = .unit
            if smallestUnit == .tenThousand {
                
                switch smallestUnit {
                case .tenThousand:
                    switch value.offset {
                    case 0:
                        unit = .tenThousand
                    case 1:
                        unit = .hundredThousand
                    case 2:
                        unit = .trilion
                    default:
                        print("")
                    }
                default:
                    print("")
                }
            }else{
                
                switch value.offset {
                case 0:
                    unit = .unit
                case 1:
                    unit = .tenThousand
                case 2:
                    unit = .hundredThousand
                case 3:
                    unit = .trilion
                default:
                    print("")
                }
            }
            return partialResult + getConvertedString(data: value.element, unit: unit ,smallestUnit: smallestUnit)
        }
        let resultValue =  resultArray.reversed().map({"\($0)"}).joined().replacingOccurrences(of: "-", with: "").trimmingCharacters(in: .whitespacesAndNewlines)
        return resultValue.isEmpty ? "" : resultValue + "원"
    }
    
    private func getConvertedString(data: String, unit: Unit,smallestUnit: Unit) -> String {
        let zeroArray = Set(data)
        if zeroArray.contains("0") && zeroArray.count < 2 { return "" }
        
        var isFlag = false
        var tmpArray = Array(data).reversed().enumerated().reduce("") { partialResult, value in
            let tmpSet = Set(partialResult+String(value.element))
            if value.offset == 0 && value.element != "0" {
                isFlag = true
            }else{
                if !isFlag && tmpSet.count <  3 && tmpSet.contains("0") {
                    return partialResult + "-"
                }
            }
            return partialResult + String(value.element)
        }

        tmpArray = tmpArray.reversed().reduce("", { partialResult, value in
            return partialResult + String(value)
        })

        if tmpArray.contains("-") {
            switch unit {
            case .tenThousand:
                return smallestUnit == .tenThousand ? Unit.tenThousand.rawValue + tmpArray : " " + Unit.tenThousand.rawValue + tmpArray
            case .hundredThousand:
                return " " + Unit.hundredThousand.rawValue + tmpArray
            case .trilion:
                return " " + Unit.trilion.rawValue + tmpArray
            case .unit:
                return tmpArray
            }
        }else{
            switch unit {
            case .tenThousand:
                return smallestUnit == .tenThousand ? Unit.tenThousand.rawValue + tmpArray.appendComma() : " " + Unit.tenThousand.rawValue + tmpArray.appendComma()
            case .hundredThousand:
                return " " + Unit.hundredThousand.rawValue + tmpArray.appendComma()
            case .trilion:
                return " " + Unit.trilion.rawValue + tmpArray.appendComma()
            case .unit:
                return tmpArray.appendComma()
            }
        }
    }

    func appendComma() -> Self {
        var array: [String] = []
        let templateArray = Array(self)

        for (index,item) in templateArray.enumerated() {
            let count = index + 1
            if count % 3 == 0 && templateArray.count > 3 {
                array.append("\(item)")
                array.append(",")
            } else {
                array.append("\(item)")
            }
        }
        
        return array.joined(separator: "")
    }
    
    // https://velog.io/@baecheese
    public var toInt: Int {
        let value = self.replaceToPureNumber
        if value > Double(Int.max) {
            let str = self.substring(from: 0, to: (self.count-2))
            return Int(str.replaceToPureNumber)
        }
        return Int(self.replaceToPureNumber)
    }
    
    public var toInt64: Int64 {
        let value = self.replaceToPureNumber
        if value > Double(Int64.max) {
            let str = self.substring(from: 0, to: (self.count-2))
            return Int64(str.replaceToPureNumber)
        }
        return Int64(self.replaceToPureNumber)
    }
    
    public var toFloat: Float {
        return Float(self.replaceToPureNumber)
    }
    
    public var toDouble: Double {
        return self.replaceToPureNumber
    }

    
    func substring(from: Int, to: Int) -> String {
        guard from < count, to >= 0, to - from >= 0 else {
            return ""
        }
        
        // Index 값 획득
        let startIndex = index(self.startIndex, offsetBy: from)
        let endIndex = index(self.startIndex, offsetBy: to + 1) // '+1'이 있는 이유: endIndex는 문자열의 마지막 그 다음을 가리키기 때문
        
        // 파싱
        return String(self[startIndex ..< endIndex])
    }
    
    private var replaceToPureNumber: Double {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "ko_KR")
        let groupingSeparator = numberFormatter.groupingSeparator ?? "" // 천단위 기호
        let decimalSeparator = numberFormatter.decimalSeparator ?? "" // 소숫점 기호
        let valueString = self.replacingOccurrences(of: "[^\(decimalSeparator)\(groupingSeparator)0-9]", with: "", options: .regularExpression)
            .replacingOccurrences(of: groupingSeparator, with: "")
            .replacingOccurrences(of: decimalSeparator, with: ".") // 소숫점 기호를 .으로 변경
        return Double(valueString) ?? 0
    }
}
