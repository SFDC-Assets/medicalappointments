sfdx shane:org:create -f config/project-scratch-def.json -d 30 -s --wait 60 --userprefix medical -o appointments.workshop
sfdx force:source:push
sfdx shane:user:password:set -g User -l User -p salesforce1
sfdx force:org:open -p /lightning/setup/SetupOneHome/home
