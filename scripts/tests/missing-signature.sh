set -eu

thisDir=$(dirname "$0")
baseDir=$thisDir/..

detected=false

"$baseDir/failure-cases/missing-signature.sh" || {
    detected=true
}

if [ $detected == false ]; then
  echo "failed!"
  exit 1
fi
