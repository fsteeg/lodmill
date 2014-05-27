#!/bin/bash

# make a backup:
cp /files/open_data/closed/lobid-organisation/lobid-organisationZDB.nt /files/open_data/closed/lobid-organisation/lobid-organisationZDB.nt.bak

# move it:
ssh hduser@weywot4 'export PATH="$PATH:/opt/hadoop/hadoop/bin/"; hadoop fs -rm hbzlod/lobid-organisations/lobid-organisationZDB.nt ; hadoop fs -copyFromLocal /files/open_data/closed/lobid-organisation/lobid-organisationZDB.nt hbzlod/lobid-organisations/ ; hadoop fs -rm hbzlod/lobid-organisations/allOrganisationsWithoutZDBIsil.nt ; hadoop fs -copyFromLocal /files/open_data/closed/lobid-organisation/allOrganisationsWithoutZDBIsil.nt hbzlod/lobid-organisations/;  hadoop fs -copyFromLocal /files/open_data/closed/lobid-organisation/fundertype.nt hbzlod/lobid-organisations/ ; hadoop fs -copyFromLocal /files/open_data/closed/lobid-organisation/stocksize.nt hbzlod/lobid-organisations/ '
