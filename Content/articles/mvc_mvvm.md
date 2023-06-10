---
title: MVC, MVVM
date: 2023-06-09 17:00
description: MVC, MVVM 아키텍처 정리
tags: Article, Swift, Architecture
---
# MVC
<center><img src="https://github.com/hogumachu/hogumachu.github.io/assets/74225754/54d2cb16-556e-4f2f-baed-8d70f9a6d7b3" width="90%" height="90%"></center>

✔️ <b>Model-ViewController</b> 

✔️ 매우 단순한 구조로 처음 개발할 때 사용 (초보자가 이용하기 좋음)

### Model

✔️ 데이터 모델, 비즈니스 로직

### View

✔️ View, View의 이벤트를 컨트롤러로 보냄

### Controller

✔️ Model과 View의 기능을 제외한 모든 기능


### 단점

✔️ <b>ViewController가 하는 일이 많다.</b> (Massive ViewController)

✔️ View와 여러 로직이 밀접한 관계가 있기 때문에 UI 테스트를 하기 어렵다.

✔️ 위와 동일한 문제로 여러 로직을 테스트하기 어렵다.

# MVVM

<center><img src="https://github.com/hogumachu/hogumachu.github.io/assets/74225754/fce8251b-9d7e-4150-8359-441fbba45aa3" width="90%" height="90%"></center>

✔️ <b> Model-View-ViewModel</b>

### Model

✔️ 데이터 모델, 비즈니스 로직

### View(Controller)

✔️ View의 역할 (화면 업데이트, 사용자 상호 작용)

### ViewModel

✔️ View의 Input을 처리하여 Output을 만든다.

✔️ Model을 가공하여 View를 업데이트 (데이터 바인딩)


### 장점

✔️ View가 UI에 대한 행동만 한다. (UI 테스트 가능)

✔️ ViewModel이 기타 로직을 담당한다. (Unit 테스트 가능)


### 단점

✔️ <b>ViewModel이 하는 일이 많다.</b> (Massive ViewModel)

### 해결 방법

✔️ ViewModel을 가볍게 만들자.

✔️ ViewModel의 역할을 여러 개로 쪼갬 (MVVM-C 등)

✔️ <b>그러나 결국 역할을 쪼개다 보면 RIBs 같은 아키텍처가 되는 것이 아닌가...</b>
