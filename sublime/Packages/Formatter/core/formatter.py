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
from . import common
from ..modules import __all__ as formatter_map

log = logging.getLogger(__name__)


class Formatter(common.Module):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.kwargs = kwargs

    def run(self):
        if self.view.is_read_only() or not self.view.window() or self.view.size() == 0:
            log.error('View is not formattable.')
            return None

        formatter_plugin = formatter_map.get(self.uid)
        if formatter_plugin:
            syntax = self.get_assigned_syntax()
            if not syntax:
                self.prompt_error('Syntax out of the scope.', 'ID:' + self.uid)
            else:
                file = self.view.file_name()
                log.debug('Target: %s', file if file else '(view)')
                log.debug('Scope: %s', self.view.scope_name(self.region.begin()))
                log.debug('Syntax: %s', syntax)
                log.debug('Formatter ID: %s', self.uid)
                worker = formatter_plugin['class'](**formatter_plugin['const'], **self.kwargs)
                result = worker.format()
                if result:
                    # Pass the result back to the main thread.
                    self.view.run_command('replace_content_view', {'result': result, 'region': [self.region.a, self.region.b]})
                    return True
        else:
            log.error('Formatter ID not found: %s', self.uid)

        return False
