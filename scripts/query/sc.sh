set -eux
cardano-cli query utxo --address $(cat scripts/$BLOCKCHAIN_PREFIX/buy.addr) $BLOCKCHAIN
