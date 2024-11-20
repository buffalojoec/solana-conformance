#!/bin/bash

# ## ADDRESS LOOKUP TABLE PROGRAM
#
# Control: agave-v2.1.0: 11/18/2025         : 2800, 771
# Enable sol-get-sysvar (core-bpf)          : 2972, 599
# Skip modified accounts                    : 3039, 532
# Keymap invalid returns None               : 2739, 379,  453 skipped
# Relax_authority feature disabled (None)   :  569,  83, 2919 skipped
# Slot hashes len with modulus              :  569,  83, 2919 skipped
# Program patches 11-20                     :  633,  19, 2919 skipped
#
# -- 👍 Confirmed CU-only mismatches:
# 05174eecaa9e5feed14c295c2f5788f04f0034dd_2789718
# 23bfa3578979e31d4a358a21fb4950afec512029_2789718
# 36e43433c2609890226ea8c5586b007071b96fa4_3246919
# 4d943b28230dcf4eede73596e4bba32e909ec6ff_2789718
# 576d307abb68434d34ef61132ca4bb968f6586b6_2789718
# 5dba6ce7916f5f87bb2b471c9cb9ab1a3cb6e2cf_2789718
# 5e8073ff118f8efa391a9d75a7d6eac6ff1bbfcd_3246919
# 9bba3389b58786be5c10c34e9476eafd90d4d69b_3246919
# b77455b41af5e6a9fe97069535e490c999176871_3246919
# c76ad0b104da040b0adf35bf461dd98de4b572b5_2789718
# e47d317536058a0d4b323ee6639fb68a983b7935_3246919
#
# -- 👍 Executable account data changed:
# 6d8f5dc4bb073f6ae72a950b5108c82b41c6347a_3246919
# 9017cf61dc0da7aa28a0b63a058f685e87df1e9a_2789718
# 9c02f3e6bc4f519ed342f4a017a4d7050faef079_2789718
# 9d3983516dd9cc4d515bf05f98011f22935093a4_3246919
# c328874b96d05db6bacb01c6534e43c1c065f3bd_3246919
# e5474fe3b664271f922437a3c707dc7d537d91ec_2789718
# 8ed8634c47b6265b5de88bb2f6b2c11e3e4e833e_3246919
# bb571a2e2205cdec8153bf2b7ca6043bab797701_3246919
# b7e56ebaf6df34ab71ca9c1a42c0551cfb79dab7_2789718
#
# -- 👍 This one should be allowed to pass.
#    The builtin throws `UnsupportedSysvar` because of the callsite to
#    `SlotHashes::get`, whereas the BPF program doesn't actually try to
#    obtain information about slot hashes until it's performing the check on
#    the lookup table's status. Since the status is `Activated`, the
#    conditional bails out before the BPF version needs to try to access slot
#    hash data. It's arguably a better implementation anyway.
# 8453948698a392d6ec552bb04f3af9f1bd3f34af_3246919


FIXTURE="8453948698a392d6ec552bb04f3af9f1bd3f34af_3246919.fix"

# solana-test-suite run-tests \
#     -i /home/sol/me/fuzzing/test-vectors/instr/fixtures/address-lookup-table \
#     -s /home/sol/me/fuzzing/solana-conformance/impl/lib/agave_v2.so \
#     -t /home/sol/me/fuzzing/solana-conformance/impl/lib/address-lookup-table.so

solana-test-suite execute \
    -i /home/sol/me/fuzzing/test-vectors/instr/fixtures/address-lookup-table/$FIXTURE \
    -t /home/sol/me/fuzzing/solana-conformance/impl/lib/agave_v2.so

solana-test-suite execute \
    -i /home/sol/me/fuzzing/test-vectors/instr/fixtures/address-lookup-table/$FIXTURE \
    -t /home/sol/me/fuzzing/solana-conformance/impl/lib/address-lookup-table.so


# ## COMPAT

# solana-test-suite run-tests \
#     -i /home/sol/me/fuzzing/test-vectors/instr/fixtures/address-lookup-table \
#     -s /home/sol/me/fuzzing/solana-conformance/impl/lib/agave_v2.so \
#     -t /home/sol/me/fuzzing/solana-conformance/impl/lib/address-lookup-table.so

# solana-test-suite run-tests \
#     -i /home/sol/me/fuzzing/test-vectors/instr/fixtures/config \
#     -s /home/sol/me/fuzzing/solana-conformance/impl/lib/agave_v2.so \
#     -t /home/sol/me/fuzzing/solana-conformance/impl/lib/config.so
