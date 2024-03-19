# Solana Test Suite

This tool allows for validation of targets (e.g. Firedancer) against Solana Agave by running it against a series of predefined tests. It takes human-readable Protobuf messages as inputs and runs them through the specified targets.

## Installation

Clone this repository and run:

```sh
pip install .
```

## Protobuf

Each target must contain a `sol_compat_instr_execute_v1` function that takes in a `InstrContext` message and outputs a `InstrEffects` message (see `src/test_suite/invoke.proto`). See `utils.py:process_instruction` to see how the program interacts with shared libraries.

## Usage

### Test suite

To run the test suite, use the following command:

```sh
solana-test-suite run-tests --input-dir <input_dir> --solana-target <solana_target.so> --target <firedancer> [--target <target_2> ...] --output-dir <log_output_dir>
```

| Argument        | Description                                                                                         |
|-----------------|-----------------------------------------------------------------------------------------------------|
| `--input-dir`   | Input directory containing instruction context messages in a human-readable format |
| `--solana-target` | Path to Solana Agave shared object (.so) target file            |
| `--target`      | Additional shared object (.so) target file paths  |
| `--output-dir`  | Log output directory for test results |

**Note:** Each `.so` target file name should be unique.

### Analysis

After running tests, it may be helpful to squash log files together to compare multiple outputs side-by-side via `vimdiff`. To do so:

```sh
solana-test-suite consolidate_logs --input-dir <input_dir> --output-dir <output_dir> --chunk-size <chunk_size>
```

| Argument        | Description                                                                                         |
|-----------------|-----------------------------------------------------------------------------------------------------|
| `--input-dir`   | Input directory containing test results |
| `--output-dir`  | Output directory for consolidated logs |
| `--chunk-size`  | Number of test results per file |

By default, log files are arranged lexicographically based on the test case file name. Each chunked log file is named based on the first test case in that file.
