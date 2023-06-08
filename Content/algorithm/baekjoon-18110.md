---
title: 백준: solved.ac
date: 2023-06-08 18:15
description: 백준 (18110번), solved.ac 문제 풀이
tags: Algorithm, Swift, Baekjoon
---
# solved.ac

✔️ 난이도: 실버 IV

✔️ [링크](https://www.acmicpc.net/problem/18110)

## 문제
난이도 의견이 주어지면 절사평균을 구해라.

30%의 절사평균을 구하는데 값의 상위 15%와 하위 15%를 제외한 값들에 대한 평균을 구하면 된다.

제외하는 (상위, 하위 15%) 의 수는 반올림으로 계산한다.

평균 값도 반올림하여 계산한다.


## 해결 방법

주어진 조건으로 잘 풀자.

## 전체 코드
```swift
import Foundation

func solution() -> Int {
    let n = Int(readLine()!)!
    var values: [Int] = Array(repeating: 0, count: 31)
    let exceptCount = Int(round(Double(n) * 0.15))
    
    guard n != 0 else {
        return 0
    }
    
    for _ in 0..<n {
        let k = Int(readLine()!)!
        values[k] += 1
    }

    var lowerCount = exceptCount
    var upperCount = exceptCount

    for i in 0..<values.count {
        if values[i] > 0 {
            if values[i] >= lowerCount {
                values[i] -= lowerCount
                lowerCount = 0
                break
            } else {
                lowerCount -= values[i]
                values[i] = 0
            }
        }
    }

    for i in (0..<values.count).reversed() {
        if values[i] > 0 {
            if values[i] >= upperCount {
                values[i] -= upperCount
                upperCount = 0
                break
            } else {
                upperCount -= values[i]
                values[i] = 0
            }
        }
    }

    let sum = values.enumerated().map { $0.offset * $0.element }.reduce(0, +)
    let result = Int(round(Double(sum) / Double(n - (exceptCount * 2))))
    return result
}

print(solution())

```

## 코드 설명

```swift
let n = Int(readLine()!)!
var values: [Int] = Array(repeating: 0, count: 31)
let exceptCount = Int(round(Double(n) * 0.15)) // 절사평균에 대한 수

guard n != 0 else {
    return 0
}

for _ in 0..<n {
    let k = Int(readLine()!)!
    values[k] += 1
}
```
입력 값을 받는다.

만약 n 값이 0이라면 0을 리턴한다 (난이도 0)

```swift
var lowerCount = exceptCount
var upperCount = exceptCount

for i in 0..<values.count {
    if values[i] > 0 {
        if values[i] >= lowerCount {
            values[i] -= lowerCount
            lowerCount = 0
            break
        } else {
            lowerCount -= values[i]
            values[i] = 0
        }
    }
}

for i in (0..<values.count).reversed() {
    if values[i] > 0 {
        if values[i] >= upperCount {
            values[i] -= upperCount
            upperCount = 0
            break
        } else {
            upperCount -= values[i]
            values[i] = 0
        }
    }
}
```
`values` 에 저장된 값을 상위와 하위의 개수 만큼 제외한다.


```swfit
let sum = values.enumerated().map { $0.offset * $0.element }.reduce(0, +)
let result = Int(round(Double(sum) / Double(n - (exceptCount * 2))))
return result
```
평균 값을 계산하여 리턴한다.
