import unittest
from fileMatchingFuncs import *

class TestCases(unittest.TestCase):
          
   def test_entry_init(self):
      entry = Entry('345', 'Bob Jones', 87.12, '8055551234', 'SLO')
      self.assertEqual(entry.account_num, '345')
      self.assertEqual(entry.name, 'Bob Jones')
      self.assertAlmostEqual(entry.balance, 87.12)
      self.assertEqual(entry.phone, '8055551234')
      self.assertEqual(entry.city, 'SLO')   

   def test_read_file_0(self):
      entries = []
      entries.append(Entry('100', 'Alan Jones', 348.17, '8053564820', 'SLO'))
      entries.append(Entry('700', 'Suzy Green', -14.22, '8052586912', 'SLO'))
      # call read_file with 'test0.dat'
      self.assertEqual(read_file('test0.dat'), entries)

   def test_read_file_1(self):
      entries = []
      entries.append(Entry('100', 'Alan Jones', 348.17, '8053564820', 'SLO'))
      entries.append(Entry('700', 'Suzy Green', -14.22, '8052586912', 'SLO'))
      entries.append(Entry('300', 'Mary Smith', 27.19, '8057901237', 'Santa_Maria'))
      entries.append(Entry('800', 'Mike Rosen', -104.58, '8051200891','Pismo_Beach'))
      # call read_file with 'test1.dat'
      self.assertEqual(read_file('test1.dat'), entries)
   
   def test_sorting_0(self):
      entries = []
      e0 = Entry('100', 'Alan Jones', 348.17, '8053564820', 'SLO')
      e1 = Entry('700', 'Suzy Green', -14.22, '8052586912', 'SLO')
      e2 = Entry('300', 'Mary Smith', 27.19, '8057901237', 'Santa_Maria')
      e3 = Entry('800', 'Mike Rosen', -104.58, '8051200891','Pismo_Beach')
      entries.append(e0)
      entries.append(e1)
      entries.append(e2)
      entries.append(e3)
      self.assertEqual(sorting(entries), [e0,e2,e1,e3])
   
   def test_combine_0(self):
      entries = []
      entries.append(Entry('100', 'Alan Jones', 348.17, '8053564820', 'SLO'))
      entries.append(Entry('700', 'Suzy Green', -14.22, '8052586912', 'SLO'))
      entries.append(Entry('300', 'Mary Smith', 27.19, '8057901237', 'Santa_Maria'))
      entries.append(Entry('800', 'Mike Rosen', -104.58, '8051200891','Pismo_Beach'))
      entries1 = []
      entries1.append(Entry('100', None, 348.17, None, None))
      entries1.append(Entry('700', None, -14.22, None, None))
      entries1.append(Entry('300', None, 27.19, None, None))
      entries1.append(Entry('800', None, 104.58, None, None))
      entries1.append(Entry('100', None, 348.17, None, None))
      entries2 = []
      entries2.append(Entry('100', 'Alan Jones', 3 * 348.17, '8053564820', 'SLO'))
      entries2.append(Entry('700', 'Suzy Green', 2 * -14.22, '8052586912', 'SLO'))
      entries2.append(Entry('300', 'Mary Smith', 2 * 27.19, '8057901237', 'Santa_Maria'))
      entries2.append(Entry('800', 'Mike Rosen', 0, '8051200891','Pismo_Beach'))
      self.assertEqual(combine(entries1, entries), entries2)


# Run the unit tests.
if __name__ == '__main__':
   unittest.main()

