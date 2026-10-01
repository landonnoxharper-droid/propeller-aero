#!/bin/bash

# Step 1
npx create-react-app propeller-aero

# Step 2
gh repo create propeller-aero --public --source=. --remote=origin --push

# Step 3
git switch -c update_logo

# Step 4
curl -L "https://cdn-ikponof.nitrocdn.com/vGqfYAGlOLDkYkJqZhYIYKEsibdbZnkc/assets/images/optimized/rev-f684a87/www.propelleraero.com/wp-content/uploads/2023/05/footer-logo.svg" -o src/logo.svg

# Step 5
sed -i '' 's#href="[^"]*"#href="https://www.propelleraero.com/dirtmate/"#' src/App.js

# Step 6
git add src/App.js src/logo.svg
git commit -m "Update logo and link"
git push -u origin update_logo

# Step 7
gh pr create --base master --head update_logo --title "Update logo and link" --body "Replaced the React logo with the Propeller Aero logo and updated the link to the DirtMate page."

# Step 8
gh pr merge update_logo --merge

# REPO_URL https://github.com/landonnoxharper-droid/propeller-aero
