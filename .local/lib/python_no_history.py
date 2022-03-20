#!/usr/bin/python3

from atexit import register
from os.path import expandvars, isfile
from readline import read_history_file, write_history_file

_PYTHON_HISTORY = f'{expandvars("$HOME")}/.cache/python_history'


def _write_history():
    try:
        write_history_file(_PYTHON_HISTORY)
    except OSError:
        pass


try:
    if not isfile(_PYTHON_HISTORY):
        with open(_PYTHON_HISTORY, "w") as f:
            f.write("")
    read_history_file(_PYTHON_HISTORY)
except OSError as err:
    raise err


register(_write_history)
