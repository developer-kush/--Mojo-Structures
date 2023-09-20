from structures import PriorityQueue
from random import random_ui64, seed

fn main() raises:

    var hp:PriorityQueue = PriorityQueue()

    seed()
    for _ in range(11):
        hp.push(random_ui64(5,100).to_int())
        
    while not hp.isempty():
        print(hp.pop())