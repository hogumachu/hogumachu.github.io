---
title: Protocol
date: 2023-06-11 21:30
description: Protocol이 무엇인지 알아보자
tags: Article, Swift
---
# Protocol

```plain
프로토콜은 해당 (프로토콜을 준수하는) 타입이 구현해야 하는 요구 사항을 정의한다.

즉 프로토콜은 청사진이다.
```

프로토콜에 대한 구현은 채택한 곳에서 한다. (프로토콜 자체 Extension을 사용하여 구현할 수도 있음)


## 왜 사용할까 ?

<b>재사용</b>을 하기 위해서 사용한다고 생각한다.

프로토콜을 이용하지 않으면 추후 코드가 변경될 때 꽤나 많은 코드를 변경해야 하는 일이 발생할 수 있다.


## 예시

```swift
final class UserRepository {
    func fetchUserList() -> [User] {
        // 생략
    }
}

final class SomeViewModel {
    let userRepository: UserRepository
    
    private func fetchUserList() {
        userRepository.fetchUserList
        // 생략
    }
}
```

만약 위의 코드에서 `UserRepository`의 내부가 `CoreData` 에서 `Realm` 으로 변경이 된다면?

`UserRepository`의 코드를 변경을 해야 한다. (다시 또 `CoreData` 로 변경해야 한다면..?)

그 외에도 `SomeViewModel` 을 테스트하기 위해서는 어떻게 해야 할까?

Repository 를 통해 데이터베이스 또는 네트워크를 이용해서 <b>실제 데이터를 반영을 해야 한다</b>.


## 프로토콜 사용 예시

```swift
protocol UserRepository: AnyObject {
    func fetchUserList() -> [User]
}

final class RealmUserRepository: UserRepository {
    func fetchUserList() -> [User] {
        // 생략
    }
}
```

일단 먼저 프로토콜을 생성한다.

그 다음으로 해당 프로토콜을 준수하는 객체를 생성한다.

```swift
final class SomeViewModel {
    let userRepository: UserRepository
    
    private func fetchUserList() {
        userRepository.fetchUserList
        // 생략
    }
}
```

`SomeViewModel`에서 있는 `UserRepository` 는 ViewModel은 어떤 것인지 모른다.

그냥 해당 <b>프로토콜을 준수하는 타입이 들어와서 알아서 잘하겠지</b>라고 생각할 것이다.

```swift
final class MockUserRepository: UserRepository {
    func fetchUserList() -> [User] {
        let mockUserList: [User] = // 생략
        return mockUserList
    }
}

let repository = MockUserRepository()
let viewModel = SomeViewModel(userRepository: repository)
```

이처럼 테스트를 하기 위한 Repository를 만들어서 ViewModel에 의존성을 주입할 수 있다.

그냥 프로토콜을 준수하기만 하면 된다.


## 결론

<b>(지극히 개인적인 생각입니다)</b>

✔️ 나중에 코드를 쉽게 변경하기 위해 쓴다.

✔️ 그 쉽게 변경한다는 것은 테스트하기 위해 변경하는 것도 포함이다.

✔️ 서로 간의 의존성을 낮출 수 있다. (Protocol을 사용하여 추상화)
