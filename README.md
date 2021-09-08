# Random number generator

Designed for `Crystal Fever Lottery`

Generator contract address: `0:8c1010977a5af9be509906c6a64f433c6cb1d0560cd0705ee4dccb00b644df45`

solc version: `0.47.0+commit.44cf54ba.Darwin.appleclang`

tvm_linker version: `v0.13.13`

# Verifying numbers

Edit `scripts/getCombination.py` and set `MESSAGE_ID` on line 13 using message sent to the generator. Script will parse messages and show you returned combination.

Script uses GraphQL to get all the info.

Script requires `ton-client-py` module and Python `3.6+`.

```
cd scripts
./getCombination.py
```