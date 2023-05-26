import unittest
from calculator import Calculator
 
class TestSum(unittest.TestCase):
 
  def test_sum(self):
    calculator = Calculator()
    self.assertEqual(calculator.add(1, 2), 5)

  def test_second(self):
    self.assertEqual(4, 5)
 

if __name__ =="__main__":
  unittest.main()