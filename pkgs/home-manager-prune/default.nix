{
  pkgs,
  writeShellApplication,
}:
writeShellApplication {
  name = "home-manager-prune";

  runtimeInputs = with pkgs; [ home-manager ];

  text = ''
      # Get all generations
      generations=$(home-manager generations)

    # Parse and group by date, keeping only the latest generation per day
    to_delete=$(echo "$generations" | awk '
      {
        # Extract date (YYYY-MM-DD) and generation ID
        date = $1
        id = $5

        # If this is the first generation for this date, mark it as kept
        if (!(date in seen)) {
          seen[date] = id
        } else {
          # This is not the latest for this date, mark for deletion
          print id
        }
      }
    ')

    if [ -z "$to_delete" ]; then
      echo "No generations to delete. Each date has only one generation."
      exit 0
    fi

    echo "Generations to delete:"
    echo "$to_delete"
    echo ""
    read -r -p "Delete? (y/N): " confirm

    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
      echo "Deleting generations..."
      echo "$to_delete" | xargs -n 1 home-manager remove-generations
      echo "Done!"
    else
      echo "Cancelled."
    fi
  '';
}
