#!/usr/bin/python3.3

import getopt, sys, os

class	Class:
  def __init__(self, name=None):
    self.name = name
    self.tab = 4
    self.variables = []

def usage():
  print("USAGE")

def dumpList(l):
  for i in range(len(l.variables)):
    print(l.variables[i])

""" ========================== .HH ================================"""
def writeGettersH(c):
  str = "\n\t/* ====== Getters ====== */\n"
  for i in range(len(c.variables)):
    str += "\t" + c.variables[i]["Type"] + "\t\t\tget" + c.variables[i]["Name"].title() + "() const;\n"
  return str

def writeSettersH(c):
  str = "\n\t/* ====== Setters ====== */\n"
  for i in range(len(c.variables)):
    str += "\tvoid\t\t\tset" + c.variables[i]["Name"].title() + "(" + c.variables[i]["Type"] + ");\n"
  return str

def writeDefaultH(c):
  str = "\n\t/* ====== Base ====== */\n"
  str += "\t" + c.name + "();\n"
  str += "\t" + c.name + "(const " + c.name + " &);\n"
  str += "\tvirtual ~" + c.name + "();\n"
  return str

def writeH(c):
  str = "class " + c.name + ":\n{\nprivate:\n"
  for i in range(len(c.variables)):
    str += "\t" + c.variables[i]["Type"] + "\t\t\t_" + c.variables[i]["Name"] + ";\n"
  str += "\npublic:\n"
  str += writeDefaultH(c)
  str += writeGettersH(c)
  str += writeSettersH(c)
  str += "\n\t/* ===== OTHER ===== */\n"
  str += "\n};"

  return str.expandtabs(4)

""" ========================== .CPP ================================"""
def writeBeginFunction():
  str = " {\n"
  return str

def writeEndFunction():
  str = "\n}\n\n"
  return str

def writeConstructors(c):
  str = c.name + "::" + c.name + "()"
  str += writeBeginFunction() + writeEndFunction()

  str += c.name + "::~" + c.name + "()"
  str += writeBeginFunction() + writeEndFunction()

  str += c.name + "::" + c.name + "(const " + c.name + " & obj)"
  str += writeBeginFunction() + writeEndFunction()

  str += c.name +" &\t\t" + c.name + "::operator =(const " + c.name + " & obj) {\n"
  for i in range(len(c.variables)):
    str += "\t" + c.variables[i]["Name"] + "\t\t= get" + c.variables[i]["Name"].title() + "()\n"
  str += "\treturn *this;\n"
  str +=  writeEndFunction()
  return str;

def writeGettersCpp(c):
  str = "\n/* ====== GETTERS ====== */\n"
  for i in range(len(c.variables)):
    str += c.variables[i]["Type"] + "\t\t" + c.name + "::" + c.variables[i]["Name"] + "() const"
    str += writeBeginFunction()
    str += "\treturn _" + c.variables[i]["Name"]
    str += writeEndFunction()
  return str;

def writeSettersCpp(c):
  str = "\n/* ====== SETTERS ====== */\n"
  for i in range(len(c.variables)):
    str += "void\t\t" + c.name + "::" + c.variables[i]["Name"] + "(" +  c.variables[i]["Type"] + " val)"
    str += writeBeginFunction()
    str += "\t_" + c.variables[i]["Name"] + " = val;"
    str += writeEndFunction()
  return str;

def writeCpp(c):
  str = "#include \"./" + c.name + ".hh\"\n\n"
  str += writeConstructors(c)
  str += writeGettersCpp(c)
  str += writeSettersCpp(c)

  return str.expandtabs(4)


""" ========================== ================================"""
def writeFile(filename, string):

  if os.path.exists(filename):
    print ("Class file already exists...")
    return False

  try:
    f = open(filename, "w")
  except:
    print ("Can't open " + filename)
    return False
  print ("Write " + filename)
  f.write(string)
  f.close()
  return True

if __name__ == "__main__":
  c = Class()
  while not c.name:
    c.name = input('class name: ')
  c.name = c.name.title()
  finish = 0
  while finish != 1:
    typ = input('type: ')
    name = input('name: ')
    if not typ and not name:
      finish = 1
    if typ and name:
      print(typ)
      print(name)
      c.variables.append ({
        "Type": typ,
        "Name": name
      })

  dumpList(c)
  writeFile(c.name + ".hh", writeH(c))
  writeFile(c.name + ".cpp", writeCpp(c))
