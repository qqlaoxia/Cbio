数据类型：拿什么来装数据？
====================================

序列概述
-------------------------

	::

	   >>>edward = ['Edward Gumby', 42]
	   >>>john = ['John Smith', 50]
	   >>>database = [edward, john]
	   database
	   
通用的序列操作
---------------------------------------

索引
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	
	::

	   >>> greeting = 'Hello'
	   >>> greeting[0]
	   'H'
	   
	::

	   >>> greeting[-1]
	   'o'
	   
	::

	   >>> 'Hello'[1]
	   'e'
	   
	::

	   >>> fourth = input('Year: ')[3]
	   Year: 2005
	   >>> fourth
	   '5'	  
	   
具体事例
	::

	   # 将以数指定年、月、日的日期打印出来
	   months = [
		   'January',
		   'February',
		   'March',
		   'April',
		   'May',
		   'June',
		   'July',
		   'August',
		   'September',
		   'October',
		   'November',
		   'December'
	   ]
	   # 一个列表，其中包含数1～31对应的结尾
	   endings = ['st', 'nd', 'rd'] + 17 * ['th'] \
			   + ['st', 'nd', 'rd'] + 7 * ['th'] \
			   + ['st']
	   year = input('Year: ')
	   month = input('Month (1-12): ')
	   day = input('Day (1-31): ')
	   month_number = int(month)
	   day_number = int(day)
	   # 别忘了将表示月和日的数减1，这样才能得到正确的索引
	   month_name = months[month_number-1]
	   ordinal = day + endings[day_number-1]
	   print(month_name + ' ' + ordinal + ', ' + year)
	   这个程序的运行情况类似于下面这样：
	   Year: 1974
	   Month (1-12): 8
	   Day (1-31): 16
	   August 16th, 1974	 
	

切片操作
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	::

	   >>> tag = '<a href="http://www.python.org">Python web site</a>'
	   >>> tag[9:30]
	   'http://www.python.org'
	   >>> tag[32:-4]
	   'Python web site'

	::

	   >>> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	   >>> numbers[3:6] [4, 5, 6]
	   >>> numbers[0:1] [1]
	   >>> numbers[-3:-1]
	   [8, 9]
	   >>> numbers[-3:0]
	   []
	   
具体事例
	::

	   # 从类似于http://www.something.com的URL中提取域名
	   url = input('Please enter the URL:')
	   domain = url[11:-4]
	   print("Domain name: " + domain)
	   这个程序的运行情况类似于下面这样：
	   Please enter the URL: http://www.python.org
	   Domain name: python
	   
	::

	   >>> numbers[0:10:1]
	   [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	   >>> numbers[0:10:2]
	   [1, 3, 5, 7, 9]
	   numbers[3:6:3]
	   [4]
	   >>> numbers[::4]
	   [1, 5, 9]
	   >>> numbers[8:3:-1]
	   [9, 8, 7, 6, 5]
	   >>> numbers[10:0:-2]
	   [10, 8, 6, 4, 2]
	   >>> numbers[0:10:-2]
	   []
	   >>> numbers[::-2]
	   [10, 8, 6, 4, 2]
	   >>> numbers[5::-2]
	   [6, 4, 2]
	   >>> numbers[:5:-2]
	   [10, 8]
	   
序列相加
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	::

	   >>> [1, 2, 3] + [4, 5, 6]
	   [1, 2, 3, 4, 5, 6]
	   >>> 'Hello,' + 'world!'
	   'Hello, world!'
	   >>> [1, 2, 3] + 'world!'
	   Traceback (innermost last):
	   File "<pyshell>", line 1, in ?
	   [1, 2, 3] + 'world!'
	   TypeError: can only concatenate list (not "string") to list

乘法
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	::

	   >>> 'python' * 5
	   'pythonpythonpythonpythonpython'
	   >>> [42] * 10
	   [42, 42, 42, 42, 42, 42, 42, 42, 42, 42]
	   
	::

	   >>> sequence = [None] * 10
	   >>> sequence
	   [None, None, None, None, None, None, None, None, None, None]

具体事例
	::

	   # 在位于屏幕中央且宽度合适的方框内打印一个句子
	   sentence = input("Sentence: ")
	   screen_width = 80
	   text_width = len(sentence)
	   box_width = text_width + 6
	   left_margin = (screen_width - box_width) // 2
	   print()
	   print(' ' * left_margin + '+' + '-' * (box_width-2) + '+')
	   print(' ' * left_margin + '| ' + ' ' * text_width + ' |')
	   print(' ' * left_margin + '| ' + sentence + ' |')
	   print(' ' * left_margin + '| ' + ' ' * text_width + ' |')
	   print(' ' * left_margin + '+' + '-' * (box_width-2) + '+')
	   print()
	   这个程序的运行情况类似于下面这样：
	   Sentence: He's a very naughty boy!
	   +-----------------------------+
	   |                             |
	   | He's a very naughty boy!    |
	   |                             |
	   +-----------------------------+	   

成员资格
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	::

	   >>> permissions = 'rw'
	   >>> 'w' in permissions
	   True
	   >>> 'x' in permissions
	   False
	   >>> users = ['mlh', 'foo', 'bar']
	   >>> input('Enter your user name: ') in users
	   Enter your user name: mlh
	   True
	   >>> subject = '$$$ Get rich now!!! $$$'
	   >>> '$$$' in subject
	   True	 
	   
长度、最小值和最大值
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	::

	   >>> numbers = [100, 34, 678]
	   >>> len(numbers)
	   3
	   >>> max(numbers)
	   678
	   >>> min(numbers)
	   34
	   >>> max(2, 3)
	   3
	   >>> min(9, 3, 2, 5)
	   2	   

列表：Python的助力
-------------------------------------------------

函数list
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	::

	   >>> list('Hello')
	   ['H', 'e', 'l', 'l', 'o']

基本的列表操作
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

修改列表
::::::::::::::::::::::::::::::::::::::::::::::

	::

	   >>> x = [1, 1, 1]
	   >>> x[1] = 2
	   >>> x
	   [1, 2, 1]
	   
	   
删除元素
:::::::::::::::::::::::::::::::::

	::

	   >>> names = ['Alice', 'Beth', 'Cecil', 'Dee-Dee', 'Earl']
	   >>> del names[2]
	   >>> names
	   ['Alice', 'Beth', 'Dee-Dee', 'Earl']
	   
	   
给切片赋值
::::::::::::::::::::::::::::::::::::

	::

	   >>> name = list('Perl')
	   >>> name
	   ['P', 'e', 'r', 'l']
	   >>> name[2:] = list('ar')
	   >>> name
	   ['P', 'e', 'a', 'r']
	   
	::

	   >>> name = list('Perl')
	   >>> name[1:] = list('ython')
	   >>> name
	   ['P', 'y', 't', 'h', 'o', 'n']	
	   
	::

	   >>> numbers = [1, 5]
	   >>> numbers[1:1] = [2, 3, 4]
	   >>> numbers
	   [1, 2, 3, 4, 5]
	   
	   
	::

	   >>> numbers
	   [1, 2, 3, 4, 5]
	   >>> numbers[1:4] = []
	   >>> numbers
	   [1, 5]
	   
列表方法
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

append
:::::::::::::::::::::::::::::::::

	::

	   >>> lst = [1, 2, 3]
	   >>> lst.append(4)
	   >>> lst
	   [1, 2, 3, 4]

clear
:::::::::::::::::::::::::::::::::::::::::::

	::

	   >>> lst = [1, 2, 3]
	   >>> lst.clear()
	   >>> lst
	   []

copy
:::::::::::::::::::::::::::::::::::::::

	::

	   >>> a = [1, 2, 3]
	   >>> b = a.copy()
	   >>> b[1] = 4
	   >>> a
	   [1, 2, 3]
	   
count
:::::::::::::::::::::::::::::::::::::::::::

	::

	   >>> ['to', 'be', 'or', 'not', 'to', 'be'].count('to')
	   2
	   >>> x = [[1, 2], 1, 1, [2, 1, [1, 2]]]
	   >>> x.count(1)
	   2
	   >>> x.count([1, 2])
	   1
	   
	   
extend
:::::::::::::::::::::::::::::::::::::::::::::::

	::

	   >>> a = [1, 2, 3]
	   >>> b = [4, 5, 6]
	   >>> a.extend(b)
	   >>> a
	   [1, 2, 3, 4, 5, 6]
	   
	   
index
:::::::::::::::::::::::::::::::::::::::::::::

	::

	   >>> knights = ['We', 'are', 'the', 'knights', 'who', 'say', 'ni']
	   >>> knights.index('who')
	   4
	   >>> knights.index('herring')
	   Traceback (innermost last):
	   File "<pyshell>", line 1, in ?
	   knights.index('herring')
	   ValueError: list.index(x): x not in list
	   >>> knights[4]
	   'who'

insert
:::::::::::::::::::::::::::::::::::

	::

	   >>> numbers = [1, 2, 3, 5, 6, 7]
	   >>> numbers.insert(3, 'four')
	   >>> numbers
	   [1, 2, 3, 'four', 5, 6, 7]
	   
pop
:::::::::::::::::::::::::::::::::::::::::::

	::

	   >>> x = [1, 2, 3]
	   >>> x.pop()
	   3
	   >>> x
	   [1, 2]
	   >>> x.pop(0)
	   1
	   >>> x
	   [2]
	   
remove
:::::::::::::::::::::::::::::::::::::

	::

	   >>> x = ['to', 'be', 'or', 'not', 'to', 'be']
	   >>> x.remove('be')
	   >>> x
	   ['to', 'or', 'not', 'to', 'be']
	   >>> x.remove('bee')
	   Traceback (innermost last):
	   File "<pyshell>", line 1, in ?
	   x.remove('bee')
	   ValueError: list.remove(x): x not in list
	   
reverse
::::::::::::::::::::::::::::

	::

	   >>> x = [1, 2, 3]
	   >>> x.reverse()
	   >>> x
	   [3, 2, 1]
	   
sort
:::::::::::::::::::::::::::::::::

	::

	   >>> x = [4, 6, 2, 1, 7, 9]
	   >>> x.sort()
	   >>> x
	   [1, 2, 4, 6, 7, 9]	

	::

	   >>> x = ['aardvark', 'abalone', 'acme', 'add', 'aerate']
	   >>> x.sort(key=len)
	   >>> x
	   ['add', 'acme', 'aerate', 'abalone', 'aardvark']
		   
		   
	::

	   >>> x = [4, 6, 2, 1, 7, 9]
	   >>> x.sort(reverse=True)
	   >>> x
	   [9, 7, 6, 4, 2, 1]
	   
本章介绍的新函数
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>	


	============= ==============================================
	函数          描述
	============= ==============================================
	len(seq)      返回序列的长度
	list(seq)     将序列转换成列表
	max(args)     返回序列或一组参数中的最大值
	min(args)     返回序列和一组参数中的最小值
	reversed(seq) 让你能够反向迭代序列
	sorted(seq)   返回一个有序列表，其中包含指定序列中的所有元素
	tuple(seq)    将序列转换为元组
	============= ==============================================   


		   