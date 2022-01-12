# `bzlmod` `IllegalArgumentException` reproduction

## Getting Started

```sh
go install github.com/bazelbuild/bazelisk@v1.11.0
cd test
bazelisk run @test-0.9.0//:hey.sh -- hey
```

### Output

```
$ bazelisk run @test-0.9.0//:hey.sh -- hey
Loading: 0 packages loaded
FATAL: bazel crashed due to an internal error. Printing stack trace:
java.lang.RuntimeException: Unrecoverable error while evaluating node 'SINGLE_EXTENSIO
N_EVAL:ModuleExtensionId{bzlFileLabel=@bzlmod//:extensions.bzl, extensionName=test}' (
requested by nodes 'com.google.devtools.build.lib.bazel.bzlmod.ModuleExtensionResolutionValue$$Lambda$605/0x000000080067b840@3d055776')
        at com.google.devtools.build.skyframe.AbstractParallelEvaluator$Evaluate.run(AbstractParallelEvaluator.java:674)
        at com.google.devtools.build.lib.concurrent.AbstractQueueVisitor$WrappedRunnable.run(AbstractQueueVisitor.java:382)
        at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(Unknown Source)
        at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(Unknown Source)
        at java.base/java.lang.Thread.run(Unknown Source)
Caused by: net.starlark.java.eval.Starlark$UncheckedEvalException: IllegalArgumentException thrown during Starlark evaluation
        at <starlark>._impl(/home/matt-clarkson/.cache/bazel/_bazel_matt-clarkson/7a53d1d783ff7d7a633635d23d1080f6/external/bzlmod/extensions.bzl:11)
Caused by: java.lang.IllegalArgumentException: invalid Starlark value: class com.google.common.collect.RegularImmutableMap
        at net.starlark.java.eval.Starlark.checkValid(Starlark.java:112)
        at net.starlark.java.eval.Starlark.getattr(Starlark.java:718)
        at net.starlark.java.eval.Eval.evalDot(Eval.java:574)
        at net.starlark.java.eval.Eval.eval(Eval.java:487)
        at net.starlark.java.eval.Eval.evalCall(Eval.java:622)
        at net.starlark.java.eval.Eval.eval(Eval.java:489)
        at net.starlark.java.eval.Eval.exec(Eval.java:271)
        at net.starlark.java.eval.Eval.execStatements(Eval.java:82)
        at net.starlark.java.eval.Eval.execFor(Eval.java:126)
        at net.starlark.java.eval.Eval.exec(Eval.java:276)
        at net.starlark.java.eval.Eval.execStatements(Eval.java:82)
        at net.starlark.java.eval.Eval.execFor(Eval.java:126)
        at net.starlark.java.eval.Eval.exec(Eval.java:276)
        at net.starlark.java.eval.Eval.execStatements(Eval.java:82)
        at net.starlark.java.eval.Eval.execFunctionBody(Eval.java:66)
        at net.starlark.java.eval.StarlarkFunction.fastcall(StarlarkFunction.java:191)
        at net.starlark.java.eval.Starlark.fastcall(Starlark.java:619)
        at com.google.devtools.build.lib.bazel.bzlmod.SingleExtensionEvalFunction.compute(SingleExtensionEvalFunction.java:170)
        at com.google.devtools.build.skyframe.AbstractParallelEvaluator$Evaluate.run(AbstractParallelEvaluator.java:590)
        at com.google.devtools.build.lib.concurrent.AbstractQueueVisitor$WrappedRunnable.run(AbstractQueueVisitor.java:382)
        at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(Unknown Source)
        at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(Unknown Source)
        at java.base/java.lang.Thread.run(Unknown Source)
```
