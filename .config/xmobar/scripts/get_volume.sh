#!/bin/bash
wpctl get-volume @DEFAULT_SINK@ | awk '{print int($2 * 100)}'
