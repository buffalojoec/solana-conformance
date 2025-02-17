# `solana-test-suite`

Validate effects from clients using Protobuf messages.

**Usage**:

```console
$ solana-test-suite [OPTIONS] COMMAND [ARGS]...
```

**Options**:

* `--install-completion`: Install completion for the current shell.
* `--show-completion`: Show completion for the current shell, to copy it or customize the installation.
* `--help`: Show this message and exit.

**Commands**:

* `create-fixtures`: Create test fixtures from a directory of...
* `debug-mismatches`: Run tests on a set of targets with a list...
* `debug-non-repros`: Run tests on a set of targets with a list...
* `decode-protobufs`: Convert Context and/or Fixture messages to...
* `execute`: Execute Context or Fixture message(s) and...
* `fix-to-ctx`: Extract Context messages from Fixtures.
* `list-harness-types`: List harness types available for use.
* `regenerate-all-fixtures`: Regenerate all fixtures in provided...
* `regenerate-fixtures`: Regenerate Fixture messages by checking...
* `run-tests`: Run tests on a set of targets with a...

## `solana-test-suite create-fixtures`

Create test fixtures from a directory of Context and/or Fixture messages.
Effects are generated by the target passed in with --solana-target or -s. 
You can also pass in additional targets with --target or -t 
and use --keep-passing or -k to only generate effects for test cases that match.

**Usage**:

```console
$ solana-test-suite create-fixtures [OPTIONS]
```

**Options**:

* `-i, --input PATH`: Input protobuf file or directory of protobuf files  [default: corpus8]
* `-h, --default-harness-type TEXT`: Harness type to use for Context protobufs  [default: InstrHarness]
* `-s, --solana-target PATH`: Solana (or ground truth) shared object (.so) target file path  [default: impl/lib/libsolfuzz_agave_v2.0.so]
* `-t, --target PATH`: Shared object (.so) target file paths (pairs with --keep-passing). Targets must have required function entrypoints defined
* `-o, --output-dir PATH`: Output directory for fixtures  [default: test_fixtures]
* `-p, --num-processes INTEGER`: Number of processes to use  [default: 4]
* `-r, --readable`: Output fixtures in human-readable format
* `-k, --keep-passing`: Only keep passing test cases
* `-g, --group-by-program`: Group fixture output by program type
* `-l, --log-level INTEGER`: FD logging level  [default: 5]
* `--help`: Show this message and exit.

## `solana-test-suite debug-mismatches`

Run tests on a set of targets with a list of FuzzCorp mismatch links.

Note: each `.so` target filename must be unique.

**Usage**:

```console
$ solana-test-suite debug-mismatches [OPTIONS]
```

**Options**:

* `-s, --solana-target PATH`: Solana (or ground truth) shared object (.so) target file path  [default: impl/lib/libsolfuzz_agave_v2.0.so]
* `-h, --default-harness-type TEXT`: Harness type to use for Context protobufs  [default: InstrHarness]
* `-t, --target PATH`: Shared object (.so) target file paths (pairs with --keep-passing). Targets must have required function entrypoints defined  [default: impl/lib/libsolfuzz_firedancer.so]
* `-o, --output-dir PATH`: Output directory for messages  [default: debug_mismatch]
* `-u, --repro-urls TEXT`: Comma-delimited list of FuzzCorp mismatch links
* `-s, --section-names TEXT`: Comma-delimited list of FuzzCorp section names
* `-f, --fuzzcorp-url TEXT`: Comma-delimited list of FuzzCorp section names  [default: https://api.dev.fuzzcorp.asymmetric.re/uglyweb/firedancer-io/solfuzz/bugs/]
* `-l, --log-level INTEGER`: FD logging level  [default: 5]
* `--help`: Show this message and exit.

## `solana-test-suite debug-non-repros`

Run tests on a set of targets with a list of FuzzCorp mismatch links.

Note: each `.so` target filename must be unique.

**Usage**:

```console
$ solana-test-suite debug-non-repros [OPTIONS]
```

**Options**:

* `-s, --solana-target PATH`: Solana (or ground truth) shared object (.so) target file path  [default: impl/lib/libsolfuzz_agave_v2.0.so]
* `-t, --target PATH`: Shared object (.so) target file paths (pairs with --keep-passing). Targets must have required function entrypoints defined  [default: impl/lib/libsolfuzz_firedancer.so]
* `-o, --output-dir PATH`: Output directory for messages  [default: debug_mismatch]
* `-u, --repro-urls TEXT`: Comma-delimited list of FuzzCorp mismatch links
* `-s, --section-names TEXT`: Comma-delimited list of FuzzCorp section names
* `-f, --fuzzcorp-url TEXT`: Comma-delimited list of FuzzCorp section names  [default: https://api.dev.fuzzcorp.asymmetric.re/uglyweb/firedancer-io/solfuzz/bugs/]
* `-l, --log-level INTEGER`: FD logging level  [default: 5]
* `--help`: Show this message and exit.

## `solana-test-suite decode-protobufs`

Convert Context and/or Fixture messages to human-readable format.

**Usage**:

```console
$ solana-test-suite decode-protobufs [OPTIONS]
```

**Options**:

* `-i, --input PATH`: Input protobuf file or directory of protobuf files  [default: raw_context]
* `-o, --output-dir PATH`: Output directory for base58-encoded, Context and/or Fixture human-readable messages  [default: readable_context]
* `-p, --num-processes INTEGER`: Number of processes to use  [default: 4]
* `-h, --default-harness-type TEXT`: Harness type to use for Context protobufs  [default: InstrHarness]
* `--help`: Show this message and exit.

## `solana-test-suite execute`

Execute Context or Fixture message(s) and print the Effects.

**Usage**:

```console
$ solana-test-suite execute [OPTIONS]
```

**Options**:

* `-i, --input PATH`: Input protobuf file or directory of protobuf files
* `-h, --default-harness-type TEXT`: Harness type to use for Context protobufs  [default: InstrHarness]
* `-t, --target PATH`: Shared object (.so) target file path to execute  [default: impl/firedancer/build/native/clang/lib/libfd_exec_sol_compat.so]
* `-r, --randomize-output-buffer`: Randomizes bytes in output buffer before shared library execution
* `-l, --log-level INTEGER`: FD logging level  [default: 2]
* `--help`: Show this message and exit.

## `solana-test-suite fix-to-ctx`

Extract Context messages from Fixtures.

**Usage**:

```console
$ solana-test-suite fix-to-ctx [OPTIONS]
```

**Options**:

* `-i, --input PATH`: Input Fixture file or directory of Fixture files  [default: fixtures]
* `-o, --output-dir PATH`: Output directory for messages  [default: instr]
* `-p, --num-processes INTEGER`: Number of processes to use  [default: 4]
* `--help`: Show this message and exit.

## `solana-test-suite list-harness-types`

List harness types available for use.

**Usage**:

```console
$ solana-test-suite list-harness-types [OPTIONS]
```

**Options**:

* `--help`: Show this message and exit.

## `solana-test-suite regenerate-all-fixtures`

Regenerate all fixtures in provided test-vectors folder

**Usage**:

```console
$ solana-test-suite regenerate-all-fixtures [OPTIONS]
```

**Options**:

* `-i, --input PATH`: Input test-vectors directory  [default: corpus8]
* `-o, --output-dir PATH`: Output directory for regenerated fixtures  [default: /tmp/regenerated_fixtures]
* `-t, --target PATH`: Shared object (.so) target file path to execute  [default: impl/lib/libsolfuzz_agave_v2.0.so]
* `-s, --stubbed-target PATH`: Stubbed shared object (.so) target file path to execute  [default: impl/lib/libsolfuzz_firedancer.so]
* `--help`: Show this message and exit.

## `solana-test-suite regenerate-fixtures`

Regenerate Fixture messages by checking FeatureSet compatibility with the target shared library. 

**Usage**:

```console
$ solana-test-suite regenerate-fixtures [OPTIONS]
```

**Options**:

* `-i, --input PATH`: Either a file or directory containing messages  [default: corpus8]
* `-t, --target PATH`: Shared object (.so) target file path to execute  [default: impl/lib/libsolfuzz_agave_v2.0.so]
* `-o, --output-dir PATH`: Output directory for regenerated fixtures  [default: regenerated_fixtures]
* `-d, --dry-run`: Only print the fixtures that would be regenerated
* `-a, --all-fixtures`: Regenerate all fixtures, regardless of FeatureSet compatibility. Will apply minimum compatible features.
* `-l, --log-level INTEGER`: FD logging level  [default: 5]
* `--help`: Show this message and exit.

## `solana-test-suite run-tests`

Run tests on a set of targets with a directory of Context and/or Fixture messages.

Note: each `.so` target filename must be unique.

**Usage**:

```console
$ solana-test-suite run-tests [OPTIONS]
```

**Options**:

* `-i, --input PATH`: Input protobuf file or directory of protobuf files  [default: corpus8]
* `-h, --default-harness-type TEXT`: Harness type to use for Context protobufs  [default: InstrHarness]
* `-s, --solana-target PATH`: Solana (or ground truth) shared object (.so) target file path  [default: impl/lib/libsolfuzz_agave_v2.0.so]
* `-t, --target PATH`: Shared object (.so) target file paths  [default: impl/lib/libsolfuzz_firedancer.so]
* `-o, --output-dir PATH`: Output directory for test results  [default: test_results]
* `-p, --num-processes INTEGER`: Number of processes to use  [default: 4]
* `-r, --randomize-output-buffer`: Randomizes bytes in output buffer before shared library execution
* `-c, --chunk-size INTEGER`: Number of test results per file  [default: 10000]
* `-v, --verbose`: Verbose output: log failed test cases
* `-c, --consensus-mode`: Only fail on consensus failures. One such effect is to normalize error codes when comparing results
* `-f, --failures-only`: Only log failed test cases
* `-sf, --save-failures`: Saves failed test cases to results directory
* `-l, --log-level INTEGER`: FD logging level  [default: 5]
* `--help`: Show this message and exit.
