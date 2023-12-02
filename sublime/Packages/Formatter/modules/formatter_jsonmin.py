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
import json
import sublime
from ..core import common

log = logging.getLogger(__name__)
MODULE_CONFIG = {
    'source': 'build-in',
    'name': 'JSONMin',
    'uid': 'jsonmin',
    'type': 'minifier',
    'syntaxes': ['json'],
    'exclude_syntaxes': None,
    "executable_path": None,
    'args': None,
    'config_path': None,
    'comment': 'build-in, no executable, no config'
}


class JsonminFormatter(common.Module):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def format(self):
        try:
            text = self.get_text_from_region(self.region)
            obj = sublime.decode_value(text)
            result = json.dumps(obj, ensure_ascii=False, separators=(',', ':'), indent=None)
            return result
        except ValueError as err:
            log.error('File not formatted due to ValueError: "%s"', err)

        return None
