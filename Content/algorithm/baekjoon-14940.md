---
title: 백준: 쉬운 최단거리
date: 2023-05-16 18:15
description: 백준 (14940번), 쉬운 최단거리 문제 풀이
tags: Algorithm, Swift, Baekjoon
---
# 쉬운 최단거리

✔️ 난이도: 실버 I

✔️ [링크](https://www.acmicpc.net/problem/14940)

## 문제
지도에 있는 출발점에서 모든 부분 (움직일 수 없는 부분 제외) 까지의 거리를 구하자

가로와 세로만 움직일 수 있다.

n은 세로의 크기 (2~1000), m은 가로의 크기 (2~1000)

원래 갈 수 없는 땅은 0으로 표현하고, 갈 수 있는 땅이지만 도달할 수 없는 경우에는 -1을 출력


## 해결 방법

시작 지점에서 BFS 를 푸는 것 같이 Queue 를 이용해서 모든 구역의 최단거리를 구하자.

## 전체 코드
```swift
let v = readLine()!.split { $0 == " " }.compactMap { Int($0 )}
let n = v[0]
let m = v[1]
var start: (x: Int, y: Int) = (-1, -1)
var values: [[Int]] = []
var queue: [(x: Int, y: Int, value: Int)] = []
var queueIndex = 0
var result: [[Int]] = Array(
    repeating: Array(repeating: -1, count: m),
    count: n
)

for i in 0..<n {
    let value = readLine()!.split { $0 == " " }.compactMap { Int($0) }
    values.append(value)
    if let j = value.firstIndex(of: 2) {
        start = (i, j)
    }
}

func visit(x: Int, y: Int, value: Int) {
    let moves: [(x: Int, y: Int)] = [
        (x + 1, y),
        (x, y + 1),
        (x - 1, y),
        (x, y - 1)
    ]
    result[x][y] = value
    
    moves.forEach { move in
        if move.x >= 0 &&
            move.x < n &&
            move.y >= 0 &&
            move.y < m &&
            values[move.x][move.y] != 0 {
            if result[move.x][move.y] == -1 || result[move.x][move.y] > value + 1 {
                queue.append((x: move.x, y: move.y, value: value + 1))
            }
        }
    }
}

queue.append((start.x, start.y, 0))

while queueIndex < queue.count {
    let (x, y, value) = queue[queueIndex]
    queueIndex += 1
    if result[x][y] == -1 || result[x][y] > value + 1 {
        visit(x: x, y: y, value: value)
    }
}

for i in 0..<n {
    for j in 0..<m {
        if values[i][j] == 0 {
            result[i][j] = 0
        }
    }
}

result.forEach { value in
    print(value.map { String($0) }.joined(separator: " "))
}
```

## 코드 설명
```swift
let v = readLine()!.split { $0 == " " }.compactMap { Int($0 )}
let n = v[0]
let m = v[1]
var start: (x: Int, y: Int) = (-1, -1)
var values: [[Int]] = []
var queue: [(x: Int, y: Int, value: Int)] = []
var queueIndex = 0
var result: [[Int]] = Array(
    repeating: Array(repeating: -1, count: m),
    count: n
)

for i in 0..<n {
    let value = readLine()!.split { $0 == " " }.compactMap { Int($0) }
    values.append(value)
    if let j = value.firstIndex(of: 2) {
        start = (i, j)
    }
}
```

단순히 문제의 입력을 받는 구간

지도는 `values` 에 저장하고 시작 부분은 `start` 에 저장한다.

```swift
func visit(x: Int, y: Int, value: Int) {
    let moves: [(x: Int, y: Int)] = [
        (x + 1, y),
        (x, y + 1),
        (x - 1, y),
        (x, y - 1)
    ]
    result[x][y] = value
    
    moves.forEach { move in
        if move.x >= 0 &&
            move.x < n &&
            move.y >= 0 &&
            move.y < m &&
            values[move.x][move.y] != 0 {
            if result[move.x][move.y] == -1 || result[move.x][move.y] > value + 1 {
                queue.append((x: move.x, y: move.y, value: value + 1))
            }
        }
    }
}
```

`moves` 라는 x와 y에 대한 상하좌우를 이동한 좌표 값 배열을 생성한다.

`visit` 함수로 호출된 좌표 값의 결과 값 (result) 을 value 로 변경한다.

그리고 상하좌우로 방문할 수 있으면 queue에 추가한다 (BFS 이므로)


```swift
queue.append((start.x, start.y, 0))

while queueIndex < queue.count {
    let (x, y, value) = queue[queueIndex]
    queueIndex += 1
    if result[x][y] == -1 || result[x][y] > value + 1 {
        visit(x: x, y: y, value: value)
    }
}

for i in 0..<n {
    for j in 0..<m {
        if values[i][j] == 0 {
            result[i][j] = 0
        }
    }
}

result.forEach { value in
    print(value.map { String($0) }.joined(separator: " "))
}
```
queue에 시작점을 추가한다.

queue에 있는 값을 접근하며 만약 `visit` 할 수 있으면 visit 한다.

while 문이 모두 끝나면 문제의 조건 중 하나 인 원래 갈 수 없는 땅의 위치는 0으로 변경한다. (배열 처음에 생성할 때 -1로 생성 하였으므로 도달 할 수 없는 위치는 신경쓰지 않아도 된다.)

마지막으로 값을 출력해준다.
