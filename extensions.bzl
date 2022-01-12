def _rimpl(rctx):
    rctx.file("hey.sh", '#!/bin/sh\nset -eu\necho "${@}"')
    rctx.file("BUILD.bazel", 'exports_files(["hey.sh"], visibility=["//visibility:public"])')

_repo = repository_rule(implementation = _rimpl)

tag = tag_class(
  attrs = {
    "version": attr.string(),
    "test": attr.string_dict(),  # this cannot be read
  },
)

def _impl(mctx):
    for module in mctx.modules:
        for tag in module.tags.test:
            print(tag.test) # 💥 this creates the error
            _repo(name="test-{}".format(tag.version))

test = module_extension(
    implementation = _impl,
    tag_classes = {
        "test": tag,
    },
)
