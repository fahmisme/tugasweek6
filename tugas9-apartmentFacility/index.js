const Apartment = require('./findFacilityAtCluster');
const apartment = new Apartment();

apartment.checkFacility('mosque');
apartment.checkFacility('gym');
apartment.checkFacility('park');

