set -eux

thisDir=$(dirname "$0")
baseDir=$thisDir/../
tempDir=$baseDir/../temp

DATUM_PREFIX=${1:-0}

$baseDir/core/mint-tx.sh \
  $(cat ~/$BLOCKCHAIN_PREFIX/seller.addr) \
  ~/$BLOCKCHAIN_PREFIX/seller.skey \
  ~/$BLOCKCHAIN_PREFIX/buyer.skey \
  "1 $(cat $baseDir/minter-id.txt).746F6B656E"
