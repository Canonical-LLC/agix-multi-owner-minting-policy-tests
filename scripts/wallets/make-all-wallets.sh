set -eux
mkdir -p scripts/temp/
mkdir -p ~/$BLOCKCHAIN_PREFIX
./scripts/wallets/make-wallet-and-pkh.sh seller
./scripts/wallets/make-wallet-and-pkh.sh buyer
