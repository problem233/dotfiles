#!/usr/bin/python
import traceback

class Calc:
  def __init__(self, env = {}):
    self.env = {
      '__name__': None,
      '__file__': None,
      '__builtins__': None,
      'math': __import__('math'),
      'names': lambda: [name for name in self.env],
      'load': self.load,
      'abs': abs,
      'divmod': divmod,
      'bin': bin,
      'oct': oct,
      'hex': hex,
      'min': min,
      'max': max,
      'round': round
    }
    self.env.update(env)

  def execLine(self, line, isPrint = True):
    code = line.strip()
    if len(code) == 0: return
    if code[0] == '#': return
    if code.find('_') != -1:
      if isPrint: print('禁止下划线！')
      else: print('禁止下划线：', code)
      return
    try:
      result = eval(code, self.env)
      if isPrint: print(result)
    except BaseException as e:
      def common():
        print('错误！')
        traceback.print_exc(limit = 0)
      if isPrint:
        if e.__class__.__name__ == 'SyntaxError': print('语法错误！')
        elif e.__class__.__name__ == 'TypeError' and e.args[0] == '\'NoneType\' object is not subscriptable': print('变量未定义！')
        else: common()
      else: common()

  def load(self, path):
    with open(path) as f:
      for line in f: self.execLine(line, False)

  def run(self):
    while True:
      try: code = input('> ')
      except EOFError:
        print()
        break
      except KeyboardInterrupt:
        print()
        break
      self.execLine(code)

if __name__ == '__main__':
  calc = Calc()
  calc.load(__file__.replace('bin/calc.py', 'share/calc/std.calc'))
  calc.run()
