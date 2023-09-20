from utils.vector import DynamicVector
from random import random_ui64, seed

struct PriorityQueue:

    var hp: DynamicVector[Int]
    var size: Int

    fn __init__(inout self: Self, size: Int = 0):
        self.hp = DynamicVector[Int](size)
        self.size = 0

    fn __heapifyup(inout self: Self, ptr: Int):
        var idx: Int = ptr
        let temp: Int
        while idx:
            let parent = (idx - 1)//2
            if self.hp[idx] >= self.hp[parent]: break
            temp = self.hp[parent]
            self.hp[parent] = self.hp[idx]
            self.hp[idx] = temp
            idx = parent

    fn __heapifydown(inout self: Self, ptr: Int):
        var idx: Int = ptr
        let temp: Int
        while idx < self.size:
            let left = 2*idx + 1
            let right = 2*idx + 2
            if left >= self.size: break
            let min = right if right < self.size and self.hp[right] < self.hp[left] else left
            if self.hp[idx] <= self.hp[min]: break
            temp = self.hp[min]
            self.hp[min] = self.hp[idx]
            self.hp[idx] = temp
            idx = min

    fn isempty(self: Self) -> Bool: return (self.size == 0)

    fn push[](inout self: Self, val: Int):
        self.hp.push_back(val)
        self.size += 1
        self.__heapifyup(self.size-1)

    fn pop(inout self: Self) -> Int:
        let temp = self.hp[0]
        self.hp[0] = self.hp[self.size-1]
        self.hp[self.size-1] = temp
        let res = self.hp.pop_back()
        self.size -= 1
        self.__heapifydown(0)
        return res

    fn clear(inout self: Self):
        self.hp.clear()
        self.size = 0
    
    fn display(inout self: Self):
        for idx in range(self.size):
            print(self.hp[idx])