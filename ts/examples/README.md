Examples copied and tested from https://github.com/aspect-build/rules_ts/blob/main/examples to see
if I can get rules_ts and rules_js working before attemptings to set up an angular project.

TODO:

Setup workflow for managing pnpm-lock.yaml.

Adding a new package.json requires:

* Adding path in pnpm-workspace.yaml file
* Running `npx pnpm install --lockfile-only`
* Manually upating lockfile to change version from 6.0 to 6.1
  * This can probably be fixed by adding pnpm as a tool and calling it via a bazel rule.
* Updating .bazelignore to add the new node_modules path.


# Errors
<details>
<summary>`Error in fail: The npm_link_all_packages() macro loaded from @npm//:defs.bzl and called in bazel
package 'path/to/thing' may only be called in bazel packages that correspond to the pnpm root
package '' and pnpm workspace projects ''`</summary>

* Add `path/to/thing` to `//pnpm-workspace.yaml`.
* Run `npx pnpm install --lockfile-only`
* Manually change version in `pnpm-lockfile.yaml` back to 6.0
* Add `path/to/thing/node_modules` to `//.bazelignore`


</details>