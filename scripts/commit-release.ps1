param(
    [String] $version = ''
)

echo "Git configurations"
# git config --global user.email "team_interfaces+github@twilio.com"
# git config --global user.name "twilio-dx"
git config --global user.email "rohithprakashklm@gmail.com"
git config --global user.name "rohith-prakash"
if ($version -like "*draft*") {
 git add .\twiliodraft.json
} else {
 git add .\twilio.json
}

$git_status=git status --porcelain
$branch=git branch --show-current

if ($git_status -ne $null) {
    git commit -m "Update manifest to version $version"
    git push origin "$branch"
} else {
    echo "No changes to commit";
    Exit 1
}
