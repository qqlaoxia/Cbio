字符串：生物就是搞这个的
================================================

使用字符串
-----------------------------

字符串的基本操作
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	::

	   >>> website = 'http://www.python.org'
	   >>> website[-3:] = 'com'
	   Traceback (most recent call last):
	   File "<pyshell#19>", line 1, in ?
	   website[-3:] = 'com'
	   TypeError: object doesn't support slice assignment
	
	
设置字符串的格式
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

1.2.1 替换字段名
::::::::::::::::::::::::::::::::::::::::::::::::::::

	::

	   >>> "{foo} {} {bar} {}".format(1, 2, bar=4, foo=3)
	   '3 1 4 2'
		   
	::

	   >>> "{foo} {1} {bar} {0}".format(1, 2, bar=4, foo=3)
	   '3 2 4 1'
	   
	   
	::

	   >>> fullname = ["Alfred", "Smoketoomuch"]
	   >>> "Mr {name[1]}".format(name=fullname)
	   'Mr Smoketoomuch'
	   >>> import math
	   >>> tmpl = "The {mod.__name__} module defines the value {mod.pi} for π"
	   >>> tmpl.format(mod=math)
	   'The math module defines the value 3.141592653589793 for π'
	   
1.2.2 基本转换
::::::::::::::::::::::::::::::::::::::::::::

	::

	   >>> print("{pi!s} {pi!r} {pi!a}".format(pi="π"))
	   π 'π' '\u03c0'
	   
	::

	   >>> "The number is {num}".format(num=42)
	   'The number is 42'
	   >>> "The number is {num:f}".format(num=42)
	   'The number is 42.000000'
	   你也可以将其作为二进制数进行处理。
	   >>> "The number is {num:b}".format(num=42)
	   'The number is 101010'

.. raw:: html

   <p><center><b>字符串格式设置中的类型说明符</b></center></p>


	+------+--------------------------------------------------------------+
	| 类型 | 含义                                                         |
	+======+==============================================================+
	| b    | 将整数表示为二进制                                           |
	+------+--------------------------------------------------------------+
	| c    | 将整数解读为Unicode码点                                      |
	+------+--------------------------------------------------------------+
	| d    | 将整数视为十进制数进行处理，这是整数默认使用的说明符         |
	+------+--------------------------------------------------------------+
	| e    | 使用科学表示法来表示小数(用e来表示整数)                      |
	+------+--------------------------------------------------------------+
	| E    | 与e相同，但使用E来表示指数                                   |
	+------+--------------------------------------------------------------+
	| f    | 将小数表示为定点数                                           |
	+------+--------------------------------------------------------------+
	| F    | 与f相同，但对于特殊值(nan和inf)，使用大写表示                |
	+------+--------------------------------------------------------------+
	| g    | 自动在定点表示法和科学表示法之间做出                         |
	|      | 选择。这是默认用于小数的说明符，但在默认情况下至少有1位小数  |
	+------+--------------------------------------------------------------+
	| G    | 与g相同，但使用大写来表示指数和特殊值                        |
	+------+--------------------------------------------------------------+
	| n    | 与g相同，但插入随区域而异的数字分隔符                        |
	+------+--------------------------------------------------------------+
	| o    | 将整数表示为八进制数                                         |
	+------+--------------------------------------------------------------+
	| s    | 保持字符串的格式不变，这是默认用于字符串的说明符             |
	+------+--------------------------------------------------------------+
	| x    | 将整数表示为十六进制数并使用小写字母                         |
	+------+--------------------------------------------------------------+
	| X    | 与x相同，但使用大写字母                                      |
	+------+--------------------------------------------------------------+
	| %    | 将                                                           |
	|      | 数表示为百分比值(乘以100，按说明符f设置格式，再在后面加上1%) |
	+------+--------------------------------------------------------------+

宽度、精度和千位分隔符
::::::::::::::::::::::::::::::::::::::::::::::::

	::

	   >>> "{num:10}".format(num=3)
	   ' 3'
	   >>> "{name:10}".format(name="Bob")
	   'Bob 

	::

	   >>> "Pi day is {pi:.2f}".format(pi=pi)
	   'Pi day is 3.14'

	::

	   >>> "{pi:10.2f}".format(pi=pi)
	   ' 3.14'
	   
	::

	   >>> "{:.5}".format("Guido van Rossum")
	   'Guido'


符号、对齐和用0填充
:::::::::::::::::::::::::::::::::::::::::::::::

	::

	   >>> '{:010.2f}'.format(pi)
	   '0000003.14'

	::

	   要指定左对齐、右对齐和居中，可分别使用 < 、 > 和 ^ 。
	   >>> print('{0:<10.2f}\n{0:^10.2f}\n{0:>10.2f}'.format(pi))
	   3.14
		 3.14
		   3.14
		   
	::

	   使用填充字符来扩充对齐说明符
	   >>> "{:$^15}".format(" WIN BIG ")
	   '$$$ WIN BIG $$$'
	   
	::

	   >>> print('{0:10.2f}\n{1:10.2f}'.format(pi, -pi))
	   3.14
	   -3.14
	   >>> print('{0:10.2f}\n{1:=10.2f}'.format(pi, -pi))
	   3.14
	   - 3.14

	::

	   >>> print('{0:-.2}\n{1:-.2}'.format(pi, -pi)) #默认设置
	   3.1
	   -3.1
	   >>> print('{0:+.2}\n{1:+.2}'.format(pi, -pi))
	   +3.1
	   -3.1
	   >>> print('{0: .2}\n{1: .2}'.format(pi, -pi))
	   3.1
	   -3.1

 * 字符串格式设置示例*


	::

	   # 根据指定的宽度打印格式良好的价格列表
	   width = int(input('Please enter width: '))
	   price_width = 10
	   item_width = width - price_width
	   header_fmt = '{{:{}}}{{:>{}}}'.format(item_width, price_width)
	   fmt  = '{{:{}}}{{:>{}.2f}}'.format(item_width, price_width)
	   print('=' * width)
	   print(header_fmt.format('Item', 'Price'))
	   print('-' * width)
	   print(fmt.format('Apples', 0.4))
	   print(fmt.format('Pears', 0.5))
	   print(fmt.format('Cantaloupes', 1.92))
	   print(fmt.format('Dried Apricots (16 oz.)', 8))
	   print(fmt.format('Prunes (4 lbs.)', 12))
	   print('=' * width)
	   这个程序的运行情况类似于下面这样：
	   Please enter width: 35
	   ===================================
	   Item Price
	   -----------------------------------
	   Apples  0.40
	   Pears 0.50
	   Cantaloupes 1.92
	   Dried Apricots (16 oz.) 8.00
	   Prunes (4 lbs.)  12.00
	   ===================================
	   

字符串方法
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

center
:::::::::::::::::::::::::::::::::::::::::::::::::::::::

	::

	   >>> "The Middle by Jimmy Eat World".center(39)
	   ' The Middle by Jimmy Eat World '
	   >>> "The Middle by Jimmy Eat World".center(39, "*")
	   '*****The Middle by Jimmy Eat World*****'


find
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

	::

	   >>> 'With a moo-moo here, and a moo-moo there'.find('moo')
	   7
	   >>> title = "Monty Python's Flying Circus"
	   >>> title.find('Monty')
	   0
	   >>> title.find('Python')
	   6
	   >>> title.find('Flying')
	   15
	   >>> title.find('Zirquss')
	   -1
	   
join
:::::::::::::::::::::::::::::::::::


	::

	   >>> seq = [1, 2, 3, 4, 5]
	   >>> sep = '+'
	   >>> sep.join(seq) # 尝试合并一个数字列表
	   Traceback (most recent call last):
	   File "<stdin>", line 1, in ?
	   TypeError: sequence item 0: expected string, int found
	   >>> seq = ['1', '2', '3', '4', '5']
	   >>> sep.join(seq) # 合并一个字符串列表
	   '1+2+3+4+5'
	   >>> dirs = '', 'usr', 'bin', 'env'
	   >>> '/'.join(dirs)
	   '/usr/bin/env'
	   >>> print('C:' + '\\'.join(dirs))
	   C:\usr\bin\env
	   
lower
::::::::::::::::::::::::::::::::

	::

	   >>> 'Trondheim Hammer Dance'.lower()
	   'trondheim hammer dance'
	   
	   
	::

	   >>> if 'Gumby' in ['gumby', 'smith', 'jones']: print('Found it!')
	   ...
	   >>>	   
		   
	::

	   >>> name = 'Gumby'
	   >>> names = ['gumby', 'smith', 'jones']
	   >>> if name.lower() in names: print('Found it!')
	   ...
	   Found it!
	   >>>	   


replace
:::::::::::::::::::::::::::::

	::

	   >>> 'This is a test'.replace('is', 'eez')
	   'Theez eez a test'	   
	   
split
:::::::::::::::::::::::::::

	::

	   >>> '1+2+3+4+5'.split('+')
	   ['1', '2', '3', '4', '5']
	   >>> '/usr/bin/env'.split('/')
	   ['', 'usr', 'bin', 'env']
	   >>> 'Using the default'.split()
	   ['Using', 'the', 'default']	   
	   
strip
::::::::::::::::::::::::::::::::::::

	::

	   >>> ' internal whitespace is kept '.strip()
	   'internal whitespace is kept'
	   
	::

	   >>> names = ['gumby', 'smith', 'jones']
	   >>> name = 'gumby '
	   >>> if name in names: print('Found it!')
	   ...
	   >>> if name.strip() in names: print('Found it!')
	   ...
	   Found it!
	   >>>	   
		   
	::

	   你还可在一个字符串参数中指定要删除哪些字符。
	   >>> '*** SPAM * for * everyone!!! ***'.strip(' *!')
	   'SPAM * for * everyone'		   
		   
translate
:::::::::::::::::::::::::

	::

	   >>> table = str.maketrans('cs', 'kz', ' ')
	   >>> 'this is an incredible test'.translate(table)
	   'thizizaninkredibletezt'		   
		
小结
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


	::

	   本章介绍了字符串的两个重要方面。
	    1.字符串格式设置：求模运算符（ % ）可用于将值合并为包含转换标志（如 s % ）的字符串，
	   这让你能够以众多方式设置值的格式，如左对齐或右对齐，指定字段宽度和精度，添加
	   符号（正号或负号）以及在左边填充0等。
	    2.字符串方法：字符串有很多方法，有些很有用（如 split 和 join ），有些很少用到（如 istitle
	   和 capitalize ）。		   
	   
本章介绍的新函数
-------------------------------------------------	   
	   
	+--------------------------+------------------------------------------+
	| 函数                     | 描述                                     |
	+==========================+==========================================+
	| string.capwords(s[,sep]) | 使用split根据sep拆分s,将每项的首         |
	|                          | 字母大写，再以空格为分隔符将他们结合起来 |
	+--------------------------+------------------------------------------+
	| ascii(obj)               | 创建指定对象的ASCII表示                  |
	+--------------------------+------------------------------------------+	   
		   