#!/usr/bin/python3
################################
###### iDigitalFlame 2019 ######
#                              #
#            -/`               #
#            -yy-   :/`        #
#         ./-shho`:so`         #
#    .:- /syhhhh//hhs` `-`     #
#   :ys-:shhhhhhshhhh.:o- `    #
#   /yhsoshhhhhhhhhhhyho`:/.   #
#   `:yhyshhhhhhhhhhhhhh+hd:   #
#     :yssyhhhhhyhhhhhhhhdd:   #
#    .:.oyshhhyyyhhhhhhddd:    #
#    :o+hhhhhyssyhhdddmmd-     #
#     .+yhhhhyssshdmmddo.      #
#       `///yyysshd++`         #
#                              #
########## SPACEPORT ###########
################################
## New Workspace with Move
# iDigitalFlame

from sys import exit, path, argv
from os.path import dirname, abspath

path.insert(0, dirname(abspath(__file__)))

from new import i3_command, i3_output


def i3_get_focused(i3_node=None):
    if i3_node is None:
        i3_node = i3_command("get_tree")
    if i3_node is not None and "nodes" in i3_node:
        for node in i3_node["nodes"]:
            if "type" in node and node["type"] == "con":
                if (
                    "name" in node
                    and node["name"] is not None
                    and "focused" in node
                    and node["focused"]
                ):
                    if "id" in node:
                        return node["id"]
            if "type" in node and "nodes" in node:
                node_result = i3_get_focused(node)
                if node_result is not None:
                    return node_result
    return None


if __name__ == "__main__":
    i3_focused = i3_get_focused()
    i3_workspaces = i3_command("get_workspaces")
    if i3_workspaces is not None and i3_focused is not None:
        i3_next_empty = next(
            x for x in range(1, 50) if not [w for w in i3_workspaces if w["num"] == x]
        )
        i3_output(
            [
                '[con_id="%s"]' % i3_focused,
                "move",
                "container",
                "to",
                "workspace",
                str(i3_next_empty),
            ]
        )
        if len(argv) > 1:
            i3_output(["workspace", str(i3_next_empty)])
        exit(0)
    exit(1)
