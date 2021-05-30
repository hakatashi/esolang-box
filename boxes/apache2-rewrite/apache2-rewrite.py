#!/usr/bin/python3

# SPDX-FileCopyrightText: 2021 nakario <nakario@nakar.io>
# SPDX-License-Identifier: MIT

# This script starts apache2 and send an HTTP request to it.
# The input from stdin is url-encoded and given to apache as a part of an url.
# apache2 should return an response with the 'Location' header, which contains
# the output of your code as a part of an url.

import argparse
import subprocess
import sys
import time
import urllib.parse

import requests

URL_PREFIX = 'http://127.0.0.1/'

def send_request(input_str):
  encoded_input = urllib.parse.quote(input_str)
  resp = requests.head(URL_PREFIX + encoded_input)
  location = resp.headers.get('location')
  if not location:
    print('Error: no Location header in the HTTP response', file=sys.stderr)
    exit(1)
  assert location.startswith(URL_PREFIX)
  encoded_output = location[len(URL_PREFIX):]
  output_str = urllib.parse.unquote(encoded_output)
  return output_str

def start_server(conf):
  subprocess.Popen(['/usr/sbin/apache2ctl', '-f', conf])
  time.sleep(1)

def stop_server(conf):
  subprocess.call(['/usr/sbin/apache2ctl', '-f', conf, '-k', 'graceful-stop'])

def main():
  parser = argparse.ArgumentParser()
  parser.add_argument('infile', help='your code.conf')
  args = parser.parse_args()

  start_server(args.infile)

  input_str = sys.stdin.read()
  output_str = send_request(input_str)
  print(output_str, end='')

  stop_server(args.infile)

if __name__ == '__main__':
  main()
