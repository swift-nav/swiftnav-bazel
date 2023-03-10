#!/usr/bin/env python3

"""
Usages: stamp_file.py <status_file> <status_default> <template_file> <output_file>
"""

import argparse, json, io


def init() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("status")
    parser.add_argument("status_default")
    parser.add_argument("template")
    parser.add_argument("output")
    return parser.parse_args()


def merge_statuses(status: io.TextIOWrapper, status_default: dict) -> dict:
    for line in status.readlines():
        status_default[line.split(" ", 1)[0]] = line.split(" ", 1)[1].strip()

    return status_default

def main() -> None:
    args = init()
    status_default = json.loads(args.status_default)

    with open(args.status) as status, open(args.template) as tpl, open(
        args.output, "w"
    ) as out:
        template = tpl.read()
        for key, val in merge_statuses(status, status_default).items():
            template = template.replace(
                "@" + key + "@", val
            )

        out.write(template)


if __name__ == "__main__":
    main()
