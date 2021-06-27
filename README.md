# External call checks

When you call an external contract, if your call reverts, the whole transaction reverts.
But if you use the low level `.call()` function, the call reverting doesn't cause the whole transaction to revert.
The call just returns `false` as the `status`, which you should check for.
This repo is a minimal example.
