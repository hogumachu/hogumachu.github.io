---
title: RxTextField
date: 2023-07-03 18:00
description: UITextField를 RxDelegateProxy를 이용하여 사용해보자
tags: Article, Swift, RxSwift
---
# UITextField+Rx

생각보다 RxSwift에서 UITextField에 대한 지원이 적다

```swift
// RxCocoa에 있는 UITextField+Rx
extension Reactive where Base: UITextField {
    /// Reactive wrapper for `text` property.
    public var text: ControlProperty<String?> {
        value
    }
    
    /// Reactive wrapper for `text` property.
    public var value: ControlProperty<String?> {
        return base.rx.controlPropertyWithDefaultEvents(
            getter: { textField in
                textField.text
            },
            setter: { textField, value in
                // This check is important because setting text value always clears control state
                // including marked text selection which is important for proper input
                // when IME input method is used.
                if textField.text != value {
                    textField.text = value
                }
            }
        )
    }
    
    /// Bindable sink for `attributedText` property.
    public var attributedText: ControlProperty<NSAttributedString?> {
        return base.rx.controlPropertyWithDefaultEvents(
            getter: { textField in
                textField.attributedText
            },
            setter: { textField, value in
                // This check is important because setting text value always clears control state
                // including marked text selection which is important for proper input
                // when IME input method is used.
                if textField.attributedText != value {
                    textField.attributedText = value
                }
            }
        )
    }
}
```

## UITextFieldDelgate를 이용한 동작
```swift
extension SomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            // Do something
        } else if textField == urlTextField {
            // Do something
        } else if textField == descTextField {
            // Do something
        }
        return true
    }
}
```

UITextFieldDelegate를 이용하면 Delegate를 통해 받은 textField 를 이용하여 동작을 하면 된다.

그러나 if-else 가 textField 가 증가함과 동시에 증가하므로 딱히 좋은 방법은 아닌 것 같다.

## RxDelegateProxy를 활용하자


Delegate에 있는 동작을 <b>RxDelegateProxy</b>로 추가할 수 있다.


```swift
extension UITextField: HasDelegate {
    public typealias Delegate = UITextFieldDelegate
}
```

먼저 <b>UITextField</b>가 <b>HasDelegate</b> 를 준수하도록 한다.

```swift
open class RxTextFieldDelegateProxy: DelegateProxy<UITextField, UITextFieldDelegate>, DelegateProxyType {
    
    public weak private(set) var textField: UITextField?
    
    public init(textField: ParentObject) {
        self.textField = textField
        super.init(parentObject: textField, delegateProxy: RxTextFieldDelegateProxy.self)
    }
    
    public static func registerKnownImplementations() {
        self.register { RxTextFieldDelegateProxy(textField: $0) }
    }
    
    private var _returnKeyDidTapPublishSubject: PublishSubject<()>?
    
    internal var returnKeyDidTapPublishSubject: PublishSubject<()> {
        if let subject = _returnKeyDidTapPublishSubject {
            return subject
        }
        let subject = PublishSubject<()>()
        _returnKeyDidTapPublishSubject = subject
        return subject
    }
    
    deinit {
        if let subject = _returnKeyDidTapPublishSubject {
            subject.on(.completed)
        }
    }
    
}
```
다음으로 <b>DelegateProxy</b> 를 준수하여 필요한 동작을 추가한다.

그리고 <b>textFieldShouldReturn</b> 를 활용하기 위한 <b>PublishSubject</b>인 <b>returnKeyDidTapPublishSubject</b> 를 추가한다.

```swift
extension RxTextFieldDelegateProxy: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let subject = _returnKeyDidTapPublishSubject {
            subject.on(.next(()))
        }
        return self._forwardToDelegate?.textFieldShouldReturn(textField) ?? true
    }
    
}
```

추가한 <b>PublishSubject</b>에 <b>textFieldShouldReturn</b> 이 호출될 때 onNext를 보낸다.

```swift
public extension Reactive where Base: UITextField {
    
    var returnKeyDidTap: ControlEvent<Void> {
        let source = RxTextFieldDelegateProxy.proxy(for: base).returnKeyDidTapPublishSubject
        return ControlEvent(events: source)
        
    }
    
}
```

마지막으로 바로 사용하기 위해 <b>ControlEvent</b>를 만들어 사용한다.

## 활용
```swift
nameTextField.rx.returnKeyDidTap
    .withUnretained(self.urlTextField)
    .observe(on: MainScheduler.asyncInstance)
    .subscribe(onNext: { nextTextField, _ in
        nextTextField.becomeFirstResponder()
    })
    .disposed(by: disposeBag)

urlTextField.rx.returnKeyDidTap
    .withUnretained(self.descTextField)
    .observe(on: MainScheduler.asyncInstance)
    .subscribe(onNext: { nextTextField, _ in
        nextTextField.becomeFirstResponder()
    })
    .disposed(by: disposeBag)
```

위와 같이 활용하여 현재 TextField에서 return key를 입력하면 다음 입력창으로 넘어가도록 할 수 있다.
