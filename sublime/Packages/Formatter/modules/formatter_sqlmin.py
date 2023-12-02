#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# @rev          74a48aa645ba5e1955cd3e50c8e141a300ddc6f5 (74a48aa)
# @tree         0de149c628a1cd9f2ad0786bc9863e7125aa41ad (0de149c)
# @date         2023-11-27 05:08:37 +0100
# @author       bitst0rm <bitst0rm@users.noreply.github.com>
# @copyright    Copyright (c) 2019-present, Duc Ng. (bitst0rm)
# @link         https://github.com/bitst0rm
# @license      The MIT License (MIT)

import logging
import sublime
from ..core import common
from ..libs.sqlmin import sqlmin

log = logging.getLogger(__name__)
MODULE_CONFIG = {
    'source': 'https://github.com/bitst0rm',
    'name': 'SQLMin',
    'uid': 'sqlmin',
    'type': 'minifier',
    'syntaxes': ['sql'],
    'exclude_syntaxes': None,
    "executable_path": None,
    'args': None,
    'config_path': {
        'default': 'sqlmin_rc.json'
    },
    'comment': 'build-in, no executable'
}


class SqlminFormatter(common.Module):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def format(self):
        path = self.get_config_path()
        json = {}
        if path:
            with open(path, 'r', encoding='utf-8') as file:
                data = file.read()
            json = sublime.decode_value(data)
            log.debug('Current arguments: %s', json)

        try:
            text = self.get_text_from_region(self.region)
            output = sqlmin.minify(text, json)
            exitcode = output['code']
            result = output['result']

            if exitcode > 0:
                log.error('File not formatted due to an error (exitcode=%d): "%s"', exitcode, result)
            else:
                return result
        except OSError:
            log.error('An error occurred while executing the command: %s', ' '.join(json))

        return None
