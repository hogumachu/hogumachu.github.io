---
title: 백준: 헌내기는 친구가 필요해
date: 2023-06-08 22:01
description: 백준 (21736번), 헌내기는 친구가 필요해 문제 풀이
tags: Algorithm, Swift, Baekjoon
---
# 헌내기는 친구가 필요해

✔️ 난이도: 실버 II

✔️ [링크](https://www.acmicpc.net/problem/21736)

## 문제
I 에서 시작해서 만날 수 있는 P의 수를 구해라.

O는 빈 공간, X는 벽 (이동할 수 없음)

## 해결 방법

DFS (또는 BFS) 를 통해 해결한다.

## 전체 코드
```swift
let v = readLine()!.split { $0 == " " }.compactMap { Int($0) }
let n = v[0], m = v[1]
var isVisited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
var values: [[String]] = []
var start: (x: Int, y: Int) = (-1, -1)
var result = 0

for i in 0..<n {
    let value = readLine()!.map { String($0) }
    values.append(value)
    
    if let j = value.firstIndex(of: "I") {
        start = (i, j)
    }
}

func visit(x: Int, y: Int) {
    isVisited[x][y] = true
    if values[x][y] == "P" {
        result += 1
    }
    
    let moves: [(x: Int, y: Int)] = [
        (x + 1, y),
        (x, y + 1),
        (x - 1, y),
        (x, y - 1)
    ]
    
    for move in moves {
        if move.x >= 0 &&
            move.x < n &&
            move.y >= 0 &&
            move.y < m &&
            values[move.x][move.y] != "X" &&
            isVisited[move.x][move.y] == false {
            visit(x: move.x, y: move.y)
        }
    }
}

visit(x: start.x, y: start.y)

print(result == 0 ? "TT" : result)
```

## 코드 설명
```swift
let v = readLine()!.split { $0 == " " }.compactMap { Int($0) }
let n = v[0], m = v[1]
var isVisited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
var values: [[String]] = []
var start: (x: Int, y: Int) = (-1, -1)
var result = 0

for i in 0..<n {
    let value = readLine()!.map { String($0) }
    values.append(value)
    
    if let j = value.firstIndex(of: "I") {
        start = (i, j)
    }
}
```
입력 값을 받아 저장하고 `start` 라는 좌표 값을 얻는다.

```swift
func visit(x: Int, y: Int) {
    isVisited[x][y] = true
    if values[x][y] == "P" {
        result += 1
    }
    
    let moves: [(x: Int, y: Int)] = [
        (x + 1, y),
        (x, y + 1),
        (x - 1, y),
        (x, y - 1)
    ]
    
    for move in moves {
        if move.x >= 0 &&
            move.x < n &&
            move.y >= 0 &&
            move.y < m &&
            values[move.x][move.y] != "X" &&
            isVisited[move.x][move.y] == false {
            visit(x: move.x, y: move.y)
        }
    }
}

visit(x: start.x, y: start.y)

print(result == 0 ? "TT" : result)
```
상하좌우로 이동하는 것이 사이즈를 벗어나지 않고 벽(X)이 아니며 방문하지 않았아면 방문한다.

만약 결과 값이 0 이라면 문제 조건에 따라 "TT" 를 출력한다.
