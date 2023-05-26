"""The module."""
import pprint
from random import randint

from absl import app, flags
from flask import Flask

from rustdocker.python.example.calculator import calculator


FLAGS = flags.FLAGS
flags.DEFINE_string("name", None, "Your name.")
flags.DEFINE_integer("num_times", 1,
                     "Number of times to print greeting.")


# Required flag.
flags.mark_flag_as_required("name")


def init_flask():
    """Initializes flask."""
    flask_app = Flask(__name__)
    calc = calculator.Calculator()
    pprint.pprint(calculator.__dict__)

    @flask_app.route('/')
    def random_number_calculator():
        """Home route."""
        rint_1 = randint(0, 251)
        rint_2 = randint(0, 250)
        result = calc.add(rint_1, rint_2)
        return f"{rint_1} + {rint_2} = {result}?"

    return flask_app


def main(argv):
    """Main."""
    del argv  # Unused.
    # embed()
    for _ in range(0, FLAGS.num_times):
        print(f'Hello, {FLAGS.name}!')
    flask_app = init_flask()
    flask_app.run(host='0.0.0.0')


if __name__ == '__main__':

    app.run(main)
