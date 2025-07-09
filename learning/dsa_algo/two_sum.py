# Given an array of integers, return indices of the two numbers such that they add to a specific target.

# You may assume that each input would have exactly one solution and you may not use the same element twice

# Example: 
# given nums = [2, 7, 15] target = 9
# becuase num[0] + num[1] = 2 + 7 = 9,
# return [0, 1]

class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        prevMap = {} # val : index

        for i, n in enumerate(nums):
            diff = target - n
            if diff in prevMap:
                return [prevMap[diff], i]
        return