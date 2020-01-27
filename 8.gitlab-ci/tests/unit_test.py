import unittest
import sys
sys.path.append('.')
sys.path.append('../')
from lib.calc import calculate


class TestCalc(unittest.TestCase):

    def test_sum(self):
        self.assertEqual(calculate("3,+,4")[0], 7)

    def test_sub(self):
        self.assertEqual(calculate("3,-,4")[0], -1)

    def test_mul(self):
        self.assertEqual(calculate("2,*,3")[0], 6)

    def test_pow(self):
        self.assertEqual(calculate("2,**,3")[0], 8)

    def test_div(self):
        self.assertEqual(calculate("4,/,2")[0], 2)


if __name__ == '__main__':
    unittest.main()

