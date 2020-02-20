sfdx force:org:create -f config/project-scratch-def.json -d 30 -s -w 60
sfdx force:source:push
sfdx force:user:password:generate
heroku addons:create einstein-vision:starter -a einstein-vl-emea
sfdx force:org:open -p /lightning/setup/SetupOneHome/home
