sfdx force:org:create -f config/project-scratch-def.json -d 30 -s -w 60
sfdx force:source:push
sfdx force:user:password:generate
basename "${PWD/mshanemc-}" | awk -F'-' '{print "medical-appt-" $3}'
sfdx shane:heroku:repo:deploy -g mshanemc -r heroku-empty -n `basename "${PWD/mshanemc-}" | awk -F'-' '{print "medical-appt-" $3}'` -t autodeployed-demos
sfdx shane:ai:playground:setupHeroku --verbose -a `basename "${PWD/mshanemc-}" | awk -F'-' '{print "medical-appt-" $3}'` -k 
sfdx force:org:open -p /lightning/setup/SetupOneHome/home
