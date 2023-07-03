---
title: 프로그래머스: 정수를 나선형으로 배치하기
date: 2023-06-13 16:00
description: 프로그래머스 (181832번), 정수를 나선형으로 배치하기 문제 풀이
tags: Algorithm, Swift, Baekjoon
---
# 정수를 나선형으로 배치하기

✔️ 난이도: Level 0 (Level 0 치고는 어려운 것 같다)

✔️ [링크](https://school.programmers.co.kr/learn/courses/30/lessons/181832)

## 문제
정수 n 이 주어지면 나선형으로 2차원 배열을 생성하여 리턴해라.

n이 3이라면 
[[1, 2, 3]
[8, 9, 4]
[7, 6, 5]]

이런 형태로 리턴하면 된다.


## 해결 방법
n의 최대가 크지 않아 반복문이나 재귀함수 호출하면 된다.


## 전체 코드
```swift
func solution(_ n: Int) -> [[Int]] {
    var result: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    func isValidPoint(x: Int, y: Int) -> Bool {
        return x >= 0 && x < n && y >= 0 && y < n
    }
    
    func visit(x: Int, y: Int, value: Int, direction: Direction) {
        result[x][y] = value
        let (nextX, nextY) = direction.next(x: x, y: y)
        
        if isValidPoint(x: nextX, y: nextY) && result[nextX][nextY] == 0 {
            visit(x: nextX, y: nextY, value: value + 1, direction: direction)
        } else {
            let rotateDirection = direction.rotate()
            let (rotateX, rotateY) = rotateDirection.next(x: x, y: y)
            
            if isValidPoint(x: rotateX, y: rotateY) && result[rotateX][rotateY] == 0  {
                visit(x: rotateX, y: rotateY, value: value + 1, direction: rotateDirection)
            }
        }
    }
    
    visit(x: 0, y: 0, value: 1, direction: .right)
    
    return result
}

enum Direction {
    case left
    case right
    case up
    case down
    
    func next(x: Int, y: Int) -> (x: Int, y: Int) {
        switch self {
        case .left: return (x, y - 1)
        case .right: return (x, y + 1)
        case .up: return (x - 1, y)
        case .down: return (x + 1, y)
        }
    }
    
    func rotate() -> Direction {
        switch self {
        case .left: return .up
        case .right: return .down
        case .up: return .right
        case .down: return .left
        }
    }
}
```

## 설명

```swift
enum Direction {
    case left
    case right
    case up
    case down
    
    func next(x: Int, y: Int) -> (x: Int, y: Int) {
        switch self {
        case .left: return (x, y - 1)
        case .right: return (x, y + 1)
        case .up: return (x - 1, y)
        case .down: return (x + 1, y)
        }
    }
    
    func rotate() -> Direction {
        switch self {
        case .left: return .up
        case .right: return .down
        case .up: return .right
        case .down: return .left
        }
    }
}
```
회전을 위해 Direction 이라는 Enum 을 만들었다.


```swift
func solution(_ n: Int) -> [[Int]] {
    var result: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    func isValidPoint(x: Int, y: Int) -> Bool {
        return x >= 0 && x < n && y >= 0 && y < n
    }
    
    func visit(x: Int, y: Int, value: Int, direction: Direction) {
        result[x][y] = value
        let (nextX, nextY) = direction.next(x: x, y: y)
        
        if isValidPoint(x: nextX, y: nextY) && result[nextX][nextY] == 0 {
            visit(x: nextX, y: nextY, value: value + 1, direction: direction)
        } else {
            let rotateDirection = direction.rotate()
            let (rotateX, rotateY) = rotateDirection.next(x: x, y: y)
            
            if isValidPoint(x: rotateX, y: rotateY) && result[rotateX][rotateY] == 0  {
                visit(x: rotateX, y: rotateY, value: value + 1, direction: rotateDirection)
            }
        }
    }
    
    visit(x: 0, y: 0, value: 1, direction: .right)
    
    return result
}
```

결과 값에 쓰일 배열을 만들고 접근할 수 있는 좌표 값인지 확인하는 `isValidPoint` 를 만들었다.

`visit` 은 좌표와 direction을 통해 다음으로 이동할 수 있으면 이동하고,

그렇지 않으면 회전을 한 후 다음으로 이동할 수 있는지 확인한다.
