#!/usr/bin/env python3

# pylint: disable=missing-docstring


import argparse
import csv
import logging
import os
from sys import platform


def main():

    logging.basicConfig(
        format='[%(levelname)-7s] %(message)s',
        level=logging.DEBUG
    )

    parser = argparse.ArgumentParser(description='dotfile installation script.')
    parser.add_argument(
        '--dry-run',
        action='store_true',
        default=False,
        help='Dry runs the installation.'
    )
    parser.add_argument(
        '-i', '--index-file',
        action='store',
        default='./dotfiles.csv',
        help='CSV file indexing the dotfiles.'
    )
    parser.add_argument(
        '-f', '--force',
        action='store',
        default=False,
        help='Forcefully overwrites dotfiles, even when they are not symlinks.'
    )
    args = parser.parse_args()

    if args.dry_run:
        logging.info('Running in dry mode')
        os_makedirs = do_nothing
        os_remove = do_nothing
        os_symlink = do_nothing
    else:
        os_makedirs = os.makedirs
        os_remove = os.remove
        os_symlink = os.symlink

    with open(args.index_file) as raw_index_file:
        for dotfile in csv.DictReader(raw_index_file):
            src = os.path.abspath(dotfile["src"])
            if dotfile.get(platform) in ["", " ", "false", "FALSE", False]:
                continue
            tgt = os.path.expanduser(dotfile[platform])
            if not os.path.exists(src):
                logging.error('Source file %s does not exist, skipping...', src)
                continue
            if os.path.exists(tgt):
                if os.path.islink(tgt):
                    logging.warning('Removing existing symlink %s', tgt)
                    os_remove(tgt)
                elif args.force:
                    logging.warning('Forcefully removing existing dotfile %s', tgt)
                    os_remove(tgt)
                else:
                    logging.error(
                        'Target file %s already exists and is not a symlink, '
                        'skipping...',
                        tgt
                    )
                    continue
            logging.info('Linking %s (%s) -> %s', tgt, platform, src)
            os_makedirs(os.path.dirname(tgt), exist_ok=True)
            os_symlink(src, tgt)


# pylint: disable=unused-argument
def do_nothing(*args, **kwargs):
    """This function does nothing"""


if __name__ == '__main__':
    main()
