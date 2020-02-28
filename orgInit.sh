sfdx force:org:create -f config/project-scratch-def.json -d 30 -s -w 60
sfdx force:source:push
sfdx force:user:password:generate
sfdx shane:heroku:repo:deploy -g mshanemc -r heroku-empty -n `basename "${PWD/mshanemc-/}"` -t autodeployed-demos
sfdx shane:ai:playground:setupHeroku -a `basename "${PWD/mshanemc-/}"` -k
sfdx force:org:open -p /lightning/setup/SetupOneHome/home
