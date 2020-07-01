List<MedicalAppointment__c > appts = [select id, AppointmentDay__c, ScheduledDay__c  from MedicalAppointment__c];
Date trainStartDate = Date.newInstance(2016, 5, 31);
Integer daysToShift = trainStartDate.daysBetween(Date.today()) - 1;
for (MedicalAppointment__c a :appts ) {
    a.AppointmentDay__c = a.AppointmentDay__c.addDays(daysToShift);
    a.ScheduledDay__c = a.ScheduledDay__c.addDays(daysToShift);
}
appts.remove(0);
update appts;