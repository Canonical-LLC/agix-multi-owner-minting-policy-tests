set -eux

thisDir=$(dirname "$0")
baseDir=$thisDir/../
tempDir=$baseDir/../temp

mkdir -p $tempDir
$baseDir/hash-plutus.sh

bodyFile=temp/lock-tx-body.01
outFile=temp/lock-tx.01

walletAddr=$1
signingKey1=$2
value=$3
mintScript=scripts/minter.plutus

changeOutput=$(cardano-cli-balance-fixer change --address $walletAddr $BLOCKCHAIN -o "$value")

extraOutput=""
if [ "$changeOutput" != "" ];then
  extraOutput="+ $changeOutput"
fi

cardano-cli transaction build \
    --alonzo-era \
    $BLOCKCHAIN \
    $(cardano-cli-balance-fixer input --address $walletAddr $BLOCKCHAIN) \
    --tx-in-collateral $(cardano-cli-balance-fixer collateral --address $walletAddr $BLOCKCHAIN) \
    --tx-out "$walletAddr + 1862028 lovelace $extraOutput" \
    --change-address $walletAddr \
    --protocol-params-file scripts/$BLOCKCHAIN_PREFIX/protocol-parameters.json \
    --mint "-$value" \
    --mint-script-file $mintScript \
    --mint-redeemer-file $baseDir/shared-redeemers/unit.json \
    --out-file $bodyFile

cardano-cli transaction sign \
    --tx-body-file $bodyFile \
    --signing-key-file $signingKey1 \
    $BLOCKCHAIN \
    --out-file $outFile

cardano-cli transaction submit \
 $BLOCKCHAIN \
 --tx-file $outFile
