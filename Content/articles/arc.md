---
title: ARC
date: 2023-05-16 18:15
description: Swift에서 메모리 관리를 위해 사용하는 ARC
tags: Article, Swift, Memory
---
# ARC

```plain
Automatic Reference Counting - 자동 참조 카운팅
```

✔️ <b>Swift에서 제공하는 메모리 관리</b>

✔️ <b>Reference에 대한 참조 횟수</b>를 자동으로 관리해줌

✔️ 컴파일할 때 retain/release코드를 작성해줌

✔️ 참조할 때 Reference Count를 증가시키고 참조하지 않을 때 Reference Count를 감소시킴

✔️ Reference Count가 0이 되면 메모리에서 해제함

## Strong Reference Cycle
✔️ <b>강한 참조 사이클</b>

✔️ 메모리가 해제되어야 하는 상황인데 서로 참조를 하고 있어 Reference Count가 0이 되지 않는 상황

```swift
import Foundation

class Human {
    var device: Device?
    
    init(device: Device? = nil) {
        self.device = device
    }
}


class Device {
    var owner: Human?
    
    init(owner: Human? = nil) {
        self.owner = owner
    }
}

var human: Human? = Human() // RC = 1
var device: Device? = Device() // RC = 1
human?.device = device // RC = 2
device?.owner = human // RC = 2

human = nil // RC = 1
device = nil // RC = 1
```
✔️ 예시처럼 서로가 서로를 참조하고 있을 때는 메모리에 계속 남아있음

✔️ 위와 같은 상황이 반복되면 접근할 수 없는 객체가 많아지고 메모리 부족을 야기할 수 있음

## 해결 방법
✔️ <b>미소유 참조</b> 또는 <b>약한 참조</b>를 사용하면 Reference Count를 증가시키지 않기 때문에 위의 문제를 해결할 수 있음

```swift
import Foundation

class Human {
    unowned var device: Device?
    
    init(device: Device? = nil) {
        self.device = device
    }
}


class Device {
    weak var owner: Human?
    
    init(owner: Human? = nil) {
        self.owner = owner
    }
}

var human: Human? = Human() // RC = 1
var device: Device? = Device() // RC = 1
human?.device = device // 변화 없음
device?.owner = human // 변화 없음

human = nil // RC = 0
device = nil // RC = 0
```
### unowned - 미소유 참조
✔️ Reference Count를 증가시키지 않고 있는 그대로 값을 가져옴

<b>장점</b>: 옵셔널 체이닝을 하지 않고 값을 가져올 수 있음

<b>단점</b>: 만약 메모리에서 해제된 값을 참조하게 되면 앱이 강제 종료 (치명적)

### weak - 약한 참조
✔️ Reference Count를 증가시키지 않고 Optional로 값을 가져옴

<b>장점</b>: 값이 해제되었을 때 nil 로 받기 때문에 안전함

<b>단점</b>: 옵셔널 체이닝을 해야 하기 때문에 코드 길이가 늘어남

```swift
func weakMethod() {
    doSomething { [weak self] _ in
        guard let self else { return }
        self.doAnything()
    }
}

func unownedMethod() {
    doSomething { [unowned self] _ in
        self.doAnything()
    }
}
```

## 🤔
<b>weak참조는 옵셔널 체이닝을 위한 코드 1줄만 들어가면 되는데 굳이 unowned가 있는 이유가 있을까</b>
