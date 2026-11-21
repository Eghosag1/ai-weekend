#!/usr/bin/env bash
# Kloont de repo's die de AI Weekend-onderdelen nodig hebben, naast deze werkmap.
# Bestaat een repo al (in de doelmap of onder ~/Revenue Lab), dan wordt hij overgeslagen.
# Doelmap aanpassen: REPOS_DIR=~/ergens ./scripts/repos-klonen.sh
set -euo pipefail

REPOS_DIR="${REPOS_DIR:-$HOME/Developer}"
mkdir -p "$REPOS_DIR"

repos=(
  "Red-Pepper-Antwerp/ClientsCheck"
  "Red-Pepper-Antwerp/sprout-lead-core-new"
  "Red-Pepper-Antwerp/red-pepper-connector-vault"
  "Red-Pepper-Antwerp/night-shift-thibo"
  "Red-Pepper-Antwerp/revenuelab-portaal"
  "Eghosag1/video-agent"
  "Eghosag1/mail-bot"
)

for full in "${repos[@]}"; do
  name="${full#*/}"
  if [ -d "$REPOS_DIR/$name/.git" ]; then
    echo "OK      $name staat al in $REPOS_DIR"
    continue
  fi
  if [ "$name" = "video-agent" ] && [ -d "$HOME/Revenue Lab/VIDEO-AGENT-overdracht/.git" ]; then
    echo "OK      video-agent staat al in ~/Revenue Lab/VIDEO-AGENT-overdracht"
    continue
  fi
  if [ "$name" = "revenuelab-portaal" ] && [ -d "$HOME/Revenue Lab/revenuelab-portaal/.git" ]; then
    echo "OK      revenuelab-portaal staat al in ~/Revenue Lab/revenuelab-portaal"
    continue
  fi
  echo "KLONEN  $full"
  # sprout-lead-core-new is groot (meer dan 1 GB): een ondiepe kloon volstaat om te lezen en te bouwen.
  if [ "$name" = "sprout-lead-core-new" ]; then
    git clone --depth 50 "https://github.com/$full.git" "$REPOS_DIR/$name"
  else
    git clone "https://github.com/$full.git" "$REPOS_DIR/$name"
  fi
done

echo
echo "Klaar. Repo's staan in $REPOS_DIR (video-agent en portaal eventueel onder ~/Revenue Lab)."
