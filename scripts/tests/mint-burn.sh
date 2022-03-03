set -eu

thisDir=$(dirname "$0")
baseDir=$thisDir/..

$baseDir/happy-path/mint-tx.sh
$baseDir/wait/until-next-block.sh
$baseDir/happy-path/burn-tx.sh
$baseDir/wait/until-next-block.sh
