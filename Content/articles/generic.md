---
title: Generic
date: 2023-06-11 21:00
description: Generic이 무엇인지 알아보자
tags: Article, Swift
---
# Generic

```plain
여러 타입에 대해 동작하는 코드를 작성하고 해당 타입에 특정 요구 사항을 지정한다.
```

제네릭은 사용자가 정의한 요구 사항에 따라 모든 타입에서 작동할 수 있는 <b>재사용 가능</b>한 함수 및 타입이다.

## 예시

```swift
let tableView = UITableView()
tableView.register(SomeTableViewCell.self, forCellReuseIdentifier: "SomeTableViewCell")
```

위의 코드는 일반적으로 TableView의 Cell을 register 하는 코드이다.

만약 제네릭을 사용하지 않고 register를 간편하게 하고 싶다면


```swift
extension UITableView {
    func registerSomeTableViewCell() {
        register(SomeTableViewCell.self, forCellReuseIdentifier: "SomeTableViewCell")
    }
}
```

이런 식으로 TableView에 Extension을 이용할 수 있다.

그러나 이렇게 구현하면 Cell의 종류가 추가될 때마다 extension에 새로운 코드를 추가해야 한다.

이럴 때 제네릭을 사용하면 된다.

## 제네릭 사용 예시

```swift
extension UITableView {
    func register<T: UITableViewCell>(_ cell: T.Type) {
        let identifier = String(describing: cell)
        register(cell, forCellReuseIdentifier: identifier)
    }
}

tableView.register(SomeTableViewCell.self)
```

UITableViewCell 을 만족하는 타입을 가져와 Identifier를 만들고 register 하는 코드이다.

```swift
extension UITableView {
    func dequeueCell<T: UICollectionViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T? {
        let identifier = String(describing: cell)
        return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T
    }
}
```

동일한 방식으로 Cell을 dequeue 하는 것도 제네릭으로 만들 수 있다.

## 결론

✔️ 제네릭을 이용해 <b>재사용 가능한 코드</b>를 작성할 수 있다.
