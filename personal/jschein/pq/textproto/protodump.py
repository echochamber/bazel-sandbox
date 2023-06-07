"""The module."""
import pprint
import os

from absl import app, flags

from personal.jschein.pq.textproto import build_pb2
from google.protobuf import any_pb2
from google.protobuf import json_format



FLAGS = flags.FLAGS
flags.DEFINE_string("name", None, "Your name.")
flags.DEFINE_integer("num_times", 1,
                     "Number of times to print greeting.")
flags.DEFINE_string("json_file", "personal/jschein/pq/textproto/data/concise.json", "Json to dump to textproto.")


# Required flag.
# flags.mark_flag_as_required("name")



def main(argv):
    """Main."""
    del argv  # Unused.
    # embed()
    mything = build_pb2.ConciseQueryResult()
    mything.name = 'foo'
    print(f'Ayo {mything}')
    for _ in range(0, FLAGS.num_times):
        print(f'Hello, {FLAGS.name}!')
    query_result = build_pb2.ConciseQueryResult()
    concise_proto_json =  open(FLAGS.json_file, 'r').read()
    # json_format.Parse(concise_proto_json, query_result)
    attribute = mything.attributes["deps"]
    attribute.type = build_pb2.Attribute.LABEL_LIST
    attribute.value = bytes([1, 2, 3, 11])
    print(json_format.MessageToJson(mything))
    print(concise_proto_json)
    print(mything)

if __name__ == '__main__':
    app.run(main)
