#!/bin/bash

function run_commands() {
  local target=$1

  # Run command 1 against target
  command1 "$target" &

  # Run command 2 against target
  command2 "$target" &

  # Recurse on child targets
  for child_target in $(get_child_targets "$target"); do
    run_commands "$child_target" &
  done

  # Wait for all background processes to finish
  wait
}

# Call the function with the root target
run_commands "$root_target"
In this example, run_commands is a recursive function that takes a target as input and runs command1 and command2 against that target in the background. It then calls itself recursively on each child target returned by get_child_targets, which is a function that should return a list of child targets for a given target. Finally, the function waits for all background processes to finish using the wait command.

You can replace command1 and command2 with the actual commands you want to run against the target, and implement get_child_targets to return the child targets for your specific use case. You can also adjust the parameters of run_commands to fit your specific needs.
