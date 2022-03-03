set -eu
thisDir=$(dirname "$0")
mainDir=$thisDir/..
tempDir=$mainDir/temp

owner1=$(cat $tempDir/$BLOCKCHAIN_PREFIX/pkhs/buyer-pkh.txt)
owner2=$(cat $tempDir/$BLOCKCHAIN_PREFIX/pkhs/seller-pkh.txt)

(
cd $mainDir
cabal run exe:create-multi-owner-policy -- $owner1 $owner2 token scripts/minter.plutus
)

$thisDir/hash-plutus.sh
