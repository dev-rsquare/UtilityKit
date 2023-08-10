# UtilityKit

[![SwiftPM](https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat)](https://swift.org/package-manager/)
[![CodeCoverage](https://img.shields.io/static/v1?label=CodeCoverage&message=92.5&color=green)](https://github.com/dev-rsquare/UtilityKit.git)
[![Platform](https://img.shields.io/static/v1?label=platform&message=iOS&color=lightgrey)](https://github.com/dev-rsquare/UtilityKit.git)


공통적으로 사용되는 기능을 모듈화 진행 
각 페이지의 **READ.ME**를 읽어주세요.

**내부 도큐먼트를 보시길 권장드립니다. 
[도큐먼트](https://web-ios-docs-k19y2kljqnu8ne.sel4.cloudtype.app/docs/category/ios-tutorial---utilitykit)**

- Use {String}.isValidation() 
**이메일 유효성검사** 


## Requirement

iOS 11.0+/macOS 10.13+/tvOS 11.0+/watchOS 4.0+
[Apple developer](https://developer.apple.com/documentation/swift/array/reduce(_:_:))

## Installation 

File > Swift Packages > Add Package Dependency
Add https://github.com/dev-rsquare/UtilityKit.git
Select "Up to Next Major" with 0.0.1

``` swift 
  .package(url: "https://github.com/dev-rsquare/UtilityKit.git", .upToNextMajor(from: "0.0.1"))
```

## Coverage

<img width="614" alt="cc" src="https://user-images.githubusercontent.com/67726869/229386290-824ee43c-7b3f-4be2-a9c2-82b556f80673.png">

### validation test coverage 
<img width="677" alt="스크린샷 2023-07-06 오전 10 54 35" src="https://github.com/dev-rsquare/UtilityKit/assets/67726869/0b49e674-b47a-4f43-852e-6ea4fa32fe44">

## Custom validationKit 사용법 

### Use 커스텀 정규식 생성해서 유효성 검사하기 

 [옵션 설명]
``` swift
    .required([.english, .number, , .korean, .specialSymbols]) // 필수로 포함되어야하는 설정
     //영어, 숫자, 한글, 특수문자 4가지 옵션을 제공합니다.
```
``` swift
    .setLength(min: Int, max: Int) // 최소 최대 글자
```
``` swift
    .setSpecialCharacter(#",<.>\/?;:'"\[{\]}`~₩!@#$%^&*()-_=+\|"#) // 특수문자 설정
    //#""# 포맷형식으로 특수문자열을 전달합니다. 예시를 꼭 참고해주세요.
```
``` swift
    .setRegex([.english, .number, , .korean, .specialSymbols]) // 포함되어야하는 조건
    //영어, 숫자, 한글, 특수문자 4가지 옵션을 제공합니다.
```
``` swift
    .setLogOption(.verbose) // 로그레벨
```

### 예시 조건 
1.필수로 포함되어야하는 조건은 영어, 숫자, 특수문자  
2.입력받을 문자열의 길이의 최소길이는 8, 최대길이는 20 으로 설정  
3.커스텀으로 특수문자 지정   
4.포함되어야하는 조건은 영어와 숫자   
5.로그레벨 .verbose (상세한 로그 제공)  

**Code 사용법**

``` swift
    // 빌더패턴으로 필요한 설정을 추가해주세요.
    let builder = RegExBuilder()
                    .required([.english,.number,.specialSymbols]) // 필수로 포함되어야하는 설정
                    .setLength(min: 8, max: 20) // 최소 최대 글자
                    .setSpecialCharacter(#",<.>\/?;:'"\[{\]}`~₩!@#$%^&*()-_=+\|"#) // 특수문자 설정 
                    .setRegex([.english,.number]) // 포함되어야하는 설정
                    .setLogOption(.verbose) // 로그레벨

    //ValidationDirector를 통해 validator 인스턴스를 생성해주세요.
    let validator = ValidationDirector.createValidator(builder: builder)


    let YOURTEXT = "123456789"
    // validator 인스턴스의 isValid(String)을 통해서 유효성 검사를 진행하시면 됩니다.
    validator.isValid(YOURTEXT) { response in
        switch response {
        case .success(let success):
            print(success)
        case .failure(let failure):
            print(failure.desc)
        }
    }
    
    예상 결과 : 영어가 포함되어 있지 않습니다

```

### 사용시 주의사항
특수문자 설정시 **#"{String}"#** 포맷안에 특수문자열을 전달해주세요.  
포함조건에 특수문자가 포함되어 있지 않더라도 필수로 포함되어야하는 조건을 설정하는 경우 커스텀 특수문자가 지정을 하지않으면 기본값으로 저장된 특수문자 값을 사용합니다. 


### Quick Help 제공 
![quickhelp builder](https://github.com/PotatoArtie/ValidationKit/assets/98959780/8f1f8167-8d11-4241-b4f5-6aa7a3b2cb69)
![ezgif com-video-to-gif (14)](https://github.com/PotatoArtie/ValidationKit/assets/98959780/dd360994-6c7a-4bd3-a1d1-840024873617)



