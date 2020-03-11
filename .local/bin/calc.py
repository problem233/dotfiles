#!/usr/bin/python

class Calc:
  def __init__(self, env = {}):
    self.env = {
      '__name__': None,
      '__file__': None,
      '__builtins__': None,
      'math': __import__('math'),
      'names': lambda: [name for name in self.env]
    }
    self.env.update(env)

  def execLine(self, line, isPrint = True):
    code = line.strip()
    if len(code) == 0: return
    if code[0] == '#': return
    if code.find('_') != -1:
      print('禁止下划线：', code)
      return
    try:
      result = eval(code, self.env)
      if isPrint: print(result)
    except: print('错误：', code)

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
