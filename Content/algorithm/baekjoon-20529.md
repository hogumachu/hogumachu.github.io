---
title: 백준: 가장 가까운 세 사람의 심리적 거리
date: 2023-05-16 18:15
description: 백준 (20529번), 가장 가까운 세 사람의 심리적 거리 문제 풀이
tags: Algorithm, Swift, Baekjoon
---
# 쉬운 최단거리

✔️ 난이도: 실버 I

✔️ [링크](https://www.acmicpc.net/problem/20529)

## 문제
MBTI (총 16가지) 가 주어지면 세 사람의 심리적인 거리가 가장 낮은 값을 출력해라.

INTJ, INTP, ENTP 라고 가정하면, 

INTJ와 INTP 는 1 (J-P 다름),

INTJ와 ENTP 는 2 (I-E, J-P 다름),

INTP와 ENTP 는 1 (I-E 다름)

따라서 세 사람과의 거리는 4가 된다.

## 해결 방법

반복문을 돌려서 값을 구하고 거기서 최소값을 구하면 된다.

## 전체 코드
```swift
enum MBTI: String {
    case istj, isfj
    case infj, intj
    case istp, isfp
    case infp, intp
    case estp, esfp
    case enfp, entp
    case estj, esfj
    case enfj, entj
}

let t = Int(readLine()!)!

for _ in 0..<t {
    var mbtiStorage: [MBTI: Int] = [:]
    _ = Int(readLine()!)! // n
    readLine()!.split { $0 == " " }
        .compactMap { MBTI(rawValue: $0.lowercased()) }
        .forEach { mbti in
            let value = mbtiStorage[mbti] ?? 0
            mbtiStorage[mbti] = value + 1
        }
    
    func makeDistance(lhs: MBTI, rhs: MBTI) -> Int {
        let l = lhs.rawValue.map { String($0) }
        let r = rhs.rawValue.map { String($0) }
        return (l[0] == r[0] ? 0 : 1) + // E, I
        (l[1] == r[1] ? 0 : 1) + // S, N
        (l[2] == r[2] ? 0 : 1) + // T, F
        (l[3] == r[3] ? 0 : 1) // J, P
    }
    
    func makeMinimumDistance() -> Int {
        guard mbtiStorage.contains(where: { $0.value >= 3 }) == false else {
            return 0
        }
        var minimumValue = 100
        
        for (mbti, value) in mbtiStorage {
            let filtered = mbtiStorage.filter { $0.key != mbti }
                .map { (key, value) -> (distance: Int, mbti: MBTI, count: Int) in
                    return (makeDistance(lhs: mbti, rhs: key), key, value)
                }
                .sorted(by: { $0.distance < $1.distance })
            if value == 2 {
                minimumValue = min(minimumValue, filtered[0].distance * 2)
            } else {
                if filtered[0].count == 2 {
                    minimumValue = min(minimumValue, filtered[0].distance * 2)
                } else {
                    for i in 0..<filtered.count - 1 {
                        for j in i + 1..<filtered.count {
                            let a = filtered[i]
                            let b = filtered[j]
                            let distance = a.distance + b.distance + makeDistance(lhs: a.mbti, rhs: b.mbti)
                            minimumValue = min(minimumValue, distance)
                        }
                    }
                }
            }
        }
        
        return minimumValue
    }
    
    print(makeMinimumDistance())
}
```

## 코드 설명
```swift
enum MBTI: String {
    case istj, isfj
    case infj, intj
    case istp, isfp
    case infp, intp
    case estp, esfp
    case enfp, entp
    case estj, esfj
    case enfj, entj
}
```

MBTI 를 enum으로 정의하였다.

```swift

let t = Int(readLine()!)!

for _ in 0..<t {
    var mbtiStorage: [MBTI: Int] = [:]
    _ = Int(readLine()!)! // n
    readLine()!.split { $0 == " " }
        .compactMap { MBTI(rawValue: $0.lowercased()) }
        .forEach { mbti in
            let value = mbtiStorage[mbti] ?? 0
            mbtiStorage[mbti] = value + 1
        }
}

```
먼저 입력 값을 받아 Dictionary 로 변경해준다.

```swift
func makeDistance(lhs: MBTI, rhs: MBTI) -> Int {
    let l = lhs.rawValue.map { String($0) }
    let r = rhs.rawValue.map { String($0) }
    return (l[0] == r[0] ? 0 : 1) + // E, I
    (l[1] == r[1] ? 0 : 1) + // S, N
    (l[2] == r[2] ? 0 : 1) + // T, F
    (l[3] == r[3] ? 0 : 1) // J, P
}
```
두 MBTI 의 거리를 계산해주는 함수이다.

```swift
func makeMinimumDistance() -> Int {
    // 먼저 value가 3 이상이라면 동일한 MBTI를 가진 사람이 3명 이상이라는 의미이므로 0을 리턴한다.
    guard mbtiStorage.contains(where: { $0.value >= 3 }) == false else {
        return 0
    }
    var minimumValue = 100
    
    for (mbti, value) in mbtiStorage {
        //  MBTI 에 대한 반복문을 통해 현재 MBTI 가 제외된 `filtered` 를 만든다.
        let filtered = mbtiStorage.filter { $0.key != mbti }
            .map { (key, value) -> (distance: Int, mbti: MBTI, count: Int) in
                return (makeDistance(lhs: mbti, rhs: key), key, value)
            }
            .sorted(by: { $0.distance < $1.distance }) // distance 로 정렬을 진행한다.
            
        // 현재 선택된 MBTI인 사람이 2명이라는 뜻이므로 다른 MBTI 인 사람 1명만 고른다.
        if value == 2 {
            minimumValue = min(minimumValue, filtered[0].distance * 2) // 2를 곱하는 이유는 현재 MBTI가 2명이므로
        } else {
            // 첫번째 위치한 MBTI가 2명 이라면 현재 선택된 이 2명을 고른다.
            if filtered[0].count == 2 {
                minimumValue = min(minimumValue, filtered[0].distance * 2)
            } else {
                // 모든 경우에 해당하지 않으면 반복문을 이용하여 최소값을 업데이트한다.
                for i in 0..<filtered.count - 1 {
                    for j in i + 1..<filtered.count {
                        let a = filtered[i]
                        let b = filtered[j]
                        let distance = a.distance + b.distance + makeDistance(lhs: a.mbti, rhs: b.mbti)
                        minimumValue = min(minimumValue, distance)
                    }
                }
            }
        }
    }
    
    return minimumValue
}
```
