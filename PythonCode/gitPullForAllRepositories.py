# -*- coding: utf-8 -*-
import sys,os
import commands

def getstatusoutput(cmd):
    """Return (status, output) of executing cmd in a shell."""

    import sys
    mswindows = (sys.platform == "win32")

    import os
    if not mswindows:
		cmd = '{ ' + cmd + '; }'

    pipe = os.popen(cmd + ' 2>&1', 'r')
    text = pipe.read()
    sts = pipe.close()
    if sts is None: sts = 0
    if text[-1:] == '\n': text = text[:-1]
    return sts, text


os.chdir("D:\open-src")
print os.getcwd()
all=[x for x in os.listdir('.') if os.path.isdir(x)]
#print all
for i in all:
  newName="D:\open-src\\" + i
  os.chdir(newName)
  
  print "\n----------------------------------------" + os.getcwd() + "------------------------\n"

  #commands.getstatusoutput is not friendly in windows! use self implemenattion getstatusoutput instead.
  (status, output) = getstatusoutput('git pull') 


  if status==0:
  	print output
  else:
 	print newName + " is not a git!"
