import click

from config import STATE_DIR
from services.fs import fs
from services.ddcutil import DDCUtil

ddcutil = DDCUtil(6)


@click.command
@click.option("--brightness", required=True)
def main(brightness):
    current_brightness = ddcutil.get_current_brightness()
    fs.save_to_file(f"{STATE_DIR}/brightness.json", str(current_brightness))
    ddcutil.set_brightness(brightness)


if __name__ == "__main__":
    main()
