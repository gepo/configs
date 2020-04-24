#!/usr/bin/env python

import csv
import sys
import argparse
import codecs


def get_source(input):
    return open(input, encoding="UTF-8") if inputFileName != "-" else sys.stdin


def to_float(s):
    try:
        return float(s)
    except ValueError:
        return 0.0


def fix_nulls(s):
    for line in s:
        yield line.replace("\0", "")


parser = argparse.ArgumentParser(description="Cut csv files.")
parser.add_argument("input", metavar="input", nargs="?", default="-")
parser.add_argument(
    "-f",
    "--fields",
    dest="fields",
    default="1",
    help="comma separated list of fields indexes",
)
parser.add_argument(
    "--sum", dest="sum", action="store_true", help="calculate sum on chosen fields"
)

args = parser.parse_args()

f = get_source(args.input)
reader = csv.reader(fix_nulls(f))
writer = csv.writer(sys.stdout)

try:
    fields = [int(x.strip()) - 1 for x in args.fields.split(",")]
    max_index = max(fields)
    r = range(0, len(fields))

    if args.sum:
        totals = [0] * len(fields)

    for sourceRow in reader:
        destRow = [None] * len(fields)
        if len(sourceRow) <= max_index:
            continue

        for i in r:
            destRow[i] = sourceRow[fields[i]]
            if args.sum:
                totals[i] += to_float(destRow[i])
        if not args.sum:
            writer.writerow(destRow)

    if args.sum:
        totals[0] = round(totals[0], 2)
        writer.writerow(totals)
except (BrokenPipeError, IOError):
    f.close()

    def _void_f(*args, **kwargs):
        pass

    sys.stdout.write = _void_f
    sys.stdout.flush = _void_f
    pass
