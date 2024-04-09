#!/bin/bash

# Razer Huntsman V2 Menu to Right Option
/usr/bin/hidutil property \
	--matching '{"ProductID":0x026b}' \
	--set '{"UserKeyMapping":[
          {
            "HIDKeyboardModifierMappingSrc": 0x7000000E3,
            "HIDKeyboardModifierMappingDst": 0x7000000E2
          },
          {
            "HIDKeyboardModifierMappingSrc": 0x7000000E2,
            "HIDKeyboardModifierMappingDst": 0x7000000E3
          },
          {
            "HIDKeyboardModifierMappingSrc": 0x7000000E6,
            "HIDKeyboardModifierMappingDst": 0x7000000E7
          },
          {
            "HIDKeyboardModifierMappingSrc": 0x700000065,
            "HIDKeyboardModifierMappingDst": 0x7000000E6
          },
          {
            "HIDKeyboardModifierMappingSrc": 0x700000035,
            "HIDKeyboardModifierMappingDst": 0x700000064
          }
    ]}'
