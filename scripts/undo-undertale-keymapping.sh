#!/bin/bash

# Razer Huntsman V2 Menu to Right Option
/usr/bin/hidutil property \
  --matching '{"ProductID":0x026b}' \
  --set '{"UserKeyMapping":[
          {
            "HIDKeyboardModifierMappingSrc": 0x700000035,
            "HIDKeyboardModifierMappingDst": 0x700000064
          },
          {
            "HIDKeyboardModifierMappingSrc": 0x7000000E7,
            "HIDKeyboardModifierMappingDst": 0x7000000E6
          },
          {
            "HIDKeyboardModifierMappingSrc": 0x700000065,
            "HIDKeyboardModifierMappingDst": 0x7000000E7
          },
          {
            "HIDKeyboardModifierMappingSrc": 0x700000052,
            "HIDKeyboardModifierMappingDst": 0x70000001A
          },

          {
            "HIDKeyboardModifierMappingSrc": 0x700000051,
            "HIDKeyboardModifierMappingDst": 0x700000016
          },

          {
            "HIDKeyboardModifierMappingSrc": 0x700000050,
            "HIDKeyboardModifierMappingDst": 0x700000004
          },

          {
            "HIDKeyboardModifierMappingSrc": 0x70000004F,
            "HIDKeyboardModifierMappingDst": 0x700000007
          } 
  ]}'
