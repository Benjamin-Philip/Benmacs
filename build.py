#!/usr/bin/env python3

from pathlib import Path
import os

if __name__ == "__main__":

    for path in Path('.').rglob('*.org'):
        bash_command = f"""emacs -Q --batch --eval "(require 'org)" --eval '(org-babel-tangle-file "{path}")'"""
        os.system(bash_command)
