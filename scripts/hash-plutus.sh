cardano-cli transaction policyid \
  --script-file ./scripts/minter.plutus \
  > scripts/minter-id.txt


cardano-cli transaction policyid \
  --script-file ./scripts/minter-duplicate-owner.plutus \
  > scripts/minter-duplicate-owner-id.txt
