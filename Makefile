# Here's where we'll put our Make commands

greeting:
	echo 'hello world'

math:
	expr 2+2

all: directories downloads freshdata

directories:
	-mkdir tmp
	-mkdir data

# 'curl' is the verb to download data
# -o at the end tells it to output into _____

downloads:
	curl "https://www.imf.org/external/datamapper/api/v1/PCPIPCH?periods=2023" -o tmp/inflation.json
	curl "https://www.imf.org/external/datamapper/api/v1/countries" -o tmp/countries.json

# now convert imf data in json files to .csv
# use pre-written script with command 'node'

freshdata:
	node imf_to_csv.js
