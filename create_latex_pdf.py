#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""

"""
import sys
import os
import datetime
import time

__author__ = "Claus Haslauer (mail@planetwater.org)"
__version__ = "$Revision: 0.1 $"
__date__ = datetime.datetime(2014,2,2)


def main(talk_to_me=True):
    """
    this script uses `pdflatex` and `pdfcrop` to produce a pdf of a latex string that is passed to the script as command line argument
    
    requires valid latex installation
    
    - there is no test for this string being a valid latex expression
    
    """
    print"\n====================================\nStarting `create_latex_pdf.py` !"
    cur_path = os.getcwd() 
    
    # # check if previous files exist; if yes: delete them
    filenames = ["temp.ps"
               , "temp.aux"
               , "temp.dvi"
               , "temp.log"
               , "temp.tex"
               , "temp.pdf"
               , "temp-crop.pdf"]
    for filename in filenames:
        try:
            os.remove(filename)
        except:
            print "the file %s did not exist" % filename
            pass
           
    # # other option    
    #if os.path.isfile(os.path.join(cur_path, 'temp.ps')):
        
    
    
    
    # # this is the latex string that is being passed
    str_latex_note = sys.argv[1]
    if talk_to_me is True:
        print "latex string is:\n    %s" %  str_latex_note
 
 
     # # this is a minimal latex template into which the string is inserted
    preamble = """\documentclass{article}
\usepackage{amsmath,amssymb}
\pagestyle{empty}

\\begin{document}
{\huge
\[
 %s
 \]
}
\end{document}"""% (str_latex_note)
     
    
    ## write latex file
    cur_file = "temp.tex"
    fobj = open(os.path.join(cur_path, cur_file), 'w')
    fobj.writelines(preamble)
    fobj.close()
    
    # --------------------------------------------------------------------------------
    #                                                                    call pdflatex
    # --------------------------------------------------------------------------------
    # print cur_path
    os.chdir(cur_path)
    ## cmd = '/usr/texbin/pdflatex temp.tex'           #  pre ElCapitan
    cmd_pdflatex = '/Library/TeX/texbin/pdflatex temp.tex'
    ## cmd_pdflatex = 'pdflatex temp.tex'
    if talk_to_me is True:
        print "command for executing pdflatex:\n    ", cmd_pdflatex
    # print "running latex"
    os.system(cmd_pdflatex)
    
    # --------------------------------------------------------------------------------
    #                                                                     call pdfcrop
    # --------------------------------------------------------------------------------
    ## cmd2 = '/usr/texbin/pdfcrop temp.pdf'           #  pre ElCapitan
    ##cmd_pdfcrop = '/usr/local/texlive/2016/bin/x86_64-darwin/pdfcrop temp.pdf temp-crop.pdf --verbose'
    cmd_pdfcrop = '/Library/TeX/texbin/pdfcrop temp.pdf temp-crop.pdf'  #   --verbose'
    ## cmd_pdfcrop = 'pdfcrop temp.pdf temp-crop.pdf --verbose'
    if talk_to_me is True:
        print "command for executing pdfcrop:\n    ", cmd_pdfcrop
    os.system(cmd_pdfcrop)
    
    if talk_to_me is True:
        print"Script is done\n===================================="
    
if __name__ == '__main__':
    main()