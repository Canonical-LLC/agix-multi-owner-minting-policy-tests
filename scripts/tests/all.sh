set -eu

thisDir=$(dirname "$0")

$thisDir/mint-burn.sh
$thisDir/missing-signature.sh

echo "Tests finished successfully"
