#!/usr/bin/env python3

import csv
from optparse import OptionParser
import os
import sys


def error(msg):
    print("ERROR: " + msg, file = sys.stderr)


def warning(msg):
    print("WARNING: " + msg)


def process_dotfile(cmdline_tags, dotfile_tags):
    if not cmdline_tags or cmdline_tags == [""]:
        return True
    else:
        for tag in dotfile_tags:
            if tag in cmdline_tags:
                return True
        return False


if __name__ == '__main__':

    parser = OptionParser()
    parser.add_option(
        "--dry-run",
        action = "store_true",
        default = False,
        dest = "dry_run",
        help = "Doesn't perform any real file system operation. "
               "Use this for tests")
    parser.add_option(
        "-i", "--index-file",
        action = "store",
        dest = "index_file",
        help = "CSV file indexing the dotfiles",
        metavar = "FILE")
    parser.add_option(
        "-t", "--tags",
        action = "store",
        default = "",
        dest = "tags",
        help = "Comma separated list of tags to process. Only dotfiles having "
               "a tag in this list will be processed. If this argument is "
               "empty or unspecified, then all dotfiles are processed",
        metavar = "TAGLIST",
        type = "string")

    options, args = parser.parse_args()

    if not options.index_file:
        error("No index file specified")
        exit(-1)

    if options.dry_run:
        warning("Running in dry mode")

    with open(options.index_file) as raw_index:

        for dotfile in csv.DictReader(raw_index):

            try:

                if not process_dotfile(options.tags.split(","),
                                       dotfile["tags"].split(",")):
                    continue

                src = os.path.abspath(dotfile["src"])
                tgt = os.path.expanduser(dotfile["tgt"])

                if not os.path.exists(src):
                    raise ValueError("Source file {} doesn't exist, "
                                     "skipping...".format(src))

                if os.path.exists(tgt) and not os.path.islink(tgt):
                    raise ValueError("File at {} already exists and isn't "
                                     "a link, skipping...".format(tgt))

                if os.path.islink(tgt):
                    warning("Removing existing link " + tgt)
                    if not options.dry_run:
                        os.remove(tgt)

                if not options.dry_run:
                    os.symlink(src, tgt)

            except KeyError:
                error("Invalid line: " + str(dotfile))

            except OSError as e:
                error(str(e))

            except ValueError as e:
                error(str(e))

            else:
                print("Linked {tgt} -> {src}".format(tgt = tgt, src = src))
