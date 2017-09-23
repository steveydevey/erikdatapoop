#!/usr/bin/python
import shlex
from subprocess import Popen, PIPE

def get_exitcode_stdout_stderr(cmd):
  args = shlex.split(cmd)
  proc = Popen(args, stdout=PIPE, stderr=PIPE)
  out, err = proc.communicate()
  exitcode = proc.returncode
  return exitcode, out, err

cmd_subject = "awk '/Subject: / {print $2}' Stroop.txt"
exitcode_subject, out_subject, err_subject = get_exitcode_stdout_stderr(cmd_subject)
real_subject = out_subject.split('\n', 1)[0]

cmd_session = "awk '/Session: / {print $2}' Stroop.txt"
exitcode, out, err = get_exitcode_stdout_stderr(cmd_session)
out_session = out.split('\n', 1)[0]

print "subject,session"
print out_subject + "," + out_session
#SUBJ_NUM = `awk '/Subject: / {print $2}' Stroop.txt | uniq`
#SESS_NUM = `awk '/Session: / {print $2}' Stroop.txt | uniq`

#sed -e '/Procedure: TrialProcMain/,/DesignList.Cycle/!d' Stroop.txt | egrep 'RTTime|ACC|Cycle'

