import click

from config import STATE_DIR
from services.fs import fs
from services.ddcutil import DDCUtil

ddcutil = DDCUtil(6)


@click.command()
def main():
    data = fs.read_from_file(f"{STATE_DIR}/brightness.json")
    ddcutil.set_brightness(data)


if __name__ == "__main__":
    main()
