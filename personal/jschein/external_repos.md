Queries for debugging external repos


```bash
# find external repo names
bazel query //external:*

# See the location of the external repo in bazel's cache. Click path to open it in vscode.
bazel query --output=build --noimplicit_deps //external:bazel_tools 

# See contents of repo, this doesn't always work because sometimes they have internal only deps on external repos.
bazel query @bazel_tools//... 
```