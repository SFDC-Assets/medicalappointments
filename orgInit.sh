#sfdx force:org:create -f config/project-scratch-def.json -d 7 -s -w 60
#sfdx force:source:push
#sfdx force:user:password:generate
heroku addons:create einstein-vision:starter -a einstein-vl-emea > hc.out
cat hc.out | awk 'FNR==2{printf substr($4,1,length($4)-1)}'
cat hc.out | awk 'FNR==2{printf substr($4,1,length($4)-1)}' > EVL_EMAIL_PROPERTY.name
#cat hc.out | awk 'FNR==2{printf substr($5,1,length($5)-1)}' > EVL_PEM_PROPERTY.name
heroku config:get $(cat hc.out | awk 'FNR==2{printf substr($4,1,length($4)-1)}') -a einstein-vl-emea
#heroku config:get $(cat EVL_EMAIL_PROPERTY.name) -a einstein-vl-emea > EVL_EMAIL_PROPERTY.value
#heroku config:get $(cat EVL_PEM_PROPERTY.name) -a einstein-vl-emea > unencrypted.pem
#openssl enc -nosalt -aes-128-cbc -in unencrypted.pem -out encrypted.pem -K 90E80538F0D659F08520E86DCA86F05F -iv B8DC0A25FC6C25F568F83EF5B951FA23
#cat sec/iv.out encrypted.pem > einstein_platform.pem
#sfdx shane:ai:playground:setup -f einstein_platform.pem -e $(cat EVL_EMAIL_PROPERTY.value) -k kOgFOPDWWfCFIOhtyobwXw==
#sfdx force:org:open -p /lightning/setup/SetupOneHome/home
#rm hc.out unencrypted.pem iv.out encrypted.pem einstein_platform.pem EVL_*