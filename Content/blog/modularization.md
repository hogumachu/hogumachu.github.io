---
author: hogumachu
description: 모듈화가 필요한 이유에 대한 설명
date: 2025-01-12 12:00
tags: Blog, Swift, Modularization
published: true
---

# 모듈화를 하는 이유

이전에 [티스토리](https://hogumachu.tistory.com/35)에서 모듈화를 해야 하는 이유에 대해 게시글을 작성한 적이 있어요.<br/>
이전 글과 생각이 바뀐 것과 더 나아간 것이 있어서 다시 정리하려고 해요.
<br/>
<br/>
<br/>

### 🤨 모듈화와 생산성

---
<p align="center"><img src="/images/contents/background/perplex-background.jpg" width="80%" /></p>

먼저 모듈화를 하지 않는다면 어떠한 일이 있을까요?<br/>
일단 `private` 또는 `fileprivate`으로 선언하지 않는 한, 모든 모듈에서 접근이 가능해요.<br/>

__Q: 모든 모듈에서 접근이 가능하면 뭐가 문제인가요?__

사실 관리만 잘하면 큰 문제가 없다고 생각해요.<br/>
작은 수의 iOS 개발자와 협업을 하거나, 코드의 크기가 크지 않으면 아무 문제 없어요.<br/>
그러나 iOS 개발자가 많아지거나(또는 변경되거나) 코드의 크기가 커지면 문제가 발생해요.<br/>


#### 모듈화를 하지 않으면?

모듈화를 하지 않으면 의도와는 다르게 코드가 사용될 수 있어요.<br/>

```swift
final class UserService {
  static let shared = UserService()
}
```

사용자의 정보를 가져올 수 있고, 사용자를 설정할 수 있는 `UserSerivce`가 있다고 가정할게요.<br/>
회원가입을 한다고 가정하면, `사용자 정보 입력 -> 검증 -> 회원가입` 이런 방식으로 진행될 거에요.<br/>
`UserService`에 있는 구현은 아래와 같아요.<br/>

```swift
protocol UserStorage {
  func read(_ id: String) -> User?
  func save(_ user: User)
  func delete(_ user: User)
}

final class LocalStorage: UserStorage { /* 생략 */ }
final class RemoteStorage: UserStorage { /* 생략 */ }
```

먼저 `LocalStorage`와 `RemoteStorage`가 존재해요.<br/>

```swift
final class UserService {
  static let shared = UserService()
  private let local = LocalStorage()
  private let remote = RemoteStorage()
  
  func user(_ id: String) -> User? {
    if let user = local.read(id) {
      return user
    }
    
    if let user = remote.read(id) {
      return user
    }
    
    return nil
  }
  
  func setUser(_ user: User) {
    local.save(user)
    remote.save(user)
  }
}
```

이러한 방식으로 로컬(`LocalStorage`) 뿐만 아니라 서버(`RemoteStorage`)에도 값을 저장하고 있어요.<br/>
만약 회원가입 후에 `UserService`가 아닌 `LocalStorage`또는 `RemoteStorage`에 접근하여 `setUser(:User)`를 호출하면 어떻게 될까요?<br/>
아마도 제대로 User 정보가 저장이 되지 않아 로그인 후에 모든 기능에서 장애가 발생할 확률이 높아요.<br/>

#### 모듈화를 하게 된다면?

위와 같은 일은 확실히 줄어들어요.<br/>

```swift
/// UserModule

public final class UserService {
  public static let shared = UserService()
  / * 생략 * /
}

final class LocalStorage: UserStorage { /* 생략 */ }
final class RemoteStorage: UserStorage { /* 생략 */ }
```

```swift
import UserModule

let userService = UserService.shared
let local = LocalStorage() // 컴파일 에러
let remote = RemoteStorage() // 컴파일 에러
```

`UserSerivce`는 `public`이므로 접근이 가능하지만, `internal`은 다른 모듈에서 접근이 불가능해요.<br/>
모듈로 나누기 전에는 로컬과 서버에 모두 접근 가능했지만, 모듈화 후에는 `UserModule`을 제외하고는 접근이 불가능해요.<br/>
따라서 원하는 기능만 열어 사용하도록 만들 수 있어요.<br/>


#### 빌드 속도

모듈화를 하게 되면 빌드 속도가 빨라져 생산성을 향상시킬 수 있어요.<br/>
이를 이해하려면 먼저 증분 빌드를 알고 있어야 해요.<br/>

__증분 빌드란, 빌드가 최신 상태인 요소는 빌드를 다시 하지 않아요. 변경사항이 있는 코드만 빌드를 진행해요.__

즉, 모듈에서 변경사항이 있는 경우 다시 빌드를 해요.<br/>
<br/>
`UserSerivce`에서 변경사항이 발생했다고 가정할게요.<br/>

<p align="center"><img src="/images/blog/modularization/1.png" width="80%" /></p>

위와 같이 단일 모듈(APP)인 경우에는 결국 앱 전체가 빌드를 하게 되어요.<br/>

<p align="center"><img src="/images/blog/modularization/2.png" width="80%" /></p>

위와 같이 모듈화를 진행했다면 `PayService`와 `DriverService` 모듈은 증분 빌드로 인해 다시 빌드가 되지 않아요.<br/>
서비스가 작을 때는 유의미한 개선은 아니지만 서비스가 커지면 커질수록 훨씬 효과를 발휘해요.<br/>

#### 더 좋은 설계

모듈화를 하면 더 좋은 설계에 대한 고민할 거리를 많이 제공해요.<br/>
모듈화를 진행하지 않으면 모듈 구조에 대한 고민을 하지 않아도 돼요.<br/>
깔끔하게 폴더 정리만 하면 끝이에요.<br/>
모듈화를 하게 되면 이 영역이 모듈 수준으로 확장이 되어요.<br/>

```swift
protocol UserService {
  func isValid(user: User) -> Bool
  func login(_ user: User)
  func logout(_ user: User)
}
```

위와 같은 `UserService` 기능을 제공을 한다고 가정할게요.<br/>
사용자 검증, 로그인 그리고 로그아웃 기능을 제공하는데 이 기능이 커지면 어떻게 될까요?<br/>

```swift
final class UserServiceImpl: UserService  {
  private let naverAuth: NaverAuthenticationService
  private let appleAuth: AppleAuthenticationService
  private let kakaoAuth: KakaoAuthenticationService
  
  func isValid(user: User) -> Bool {
    swith user.loginType {
    case .naver: return naverAuth.isValid(user: user)
    case .apple: return appleAuth.isValid(user: user)
    case .kakao: return kakaoAuth.isValid(user: user)
    }
  }
  
  /* 생략 */
}
```

위와 같이 사용자 검증하는 부분에서 네이버, 애플, 카카오와 같은 여러 서비스가 들어가면 어떻게 될까요?<br/>
만약 다른 서비스가 계속해서 늘면 어떻게 될까요?<br/>
이를 해결하기 위해 사용자 검증을 위한 모듈과 객체를 만들거에요.<br/>

// TODO: - 모듈 이미지 그리고 Entity 모듈이 필요한 이유, 클린 아키텍처
// TODO: - 지도 SDK를 사용할 때 인터페이스로 잘 만들어야 하는 이유 (Naver, Kakao, Apple Map) - View 에서도 이러한 작업이 필요하다.
