#!/bin/bash

SOURCE_ROOT="/files/open_data/closed/"
SOURCE_PATH=$SOURCE_ROOT/hbzvk/snapshot
TARGET=/files/open_data/closed/hbzvk/Test/Test1
TMP_FILE=testIdsTmp.txt

# hbz
# include all junit test records
echo "building hbz01 test set ..."
tar fjt  ../../../src/test/resources/hbz01XmlClobs.tar.bz2 | cut -d '/' -f6 > $TMP_FILE
# include fix list
cat testIds.txt >> $TMP_FILE
for i in $(cat $TMP_FILE); do
	SOURCE_SUBPATH=$(echo "$i" | sed  -e 's#^..\([0-9][0-9][0-9][0-9][0-9]\).*#\1#')	
	cp $SOURCE_PATH/$SOURCE_SUBPATH/$i.bz2 $TARGET
done

#gnd
echo "building gnd test set ..."
ITEM_FILE_NT="gndTest.nt"
SOURCE_PATH_GND="$SOURCE_ROOT/gnd/gnd_snapshot"
HDFS_FILE="extlod/gnd-Test/$ITEM_FILE_NT"
TARGET_GND="/files/open_data/closed/gnd/Test/$ITEM_FILE_NT"
rm $TARGET_GND
hadoop fs -rm $HDFS_FILE

# include all gnd id's of the data which was just build
for i in $(ls $TARGET); do
	a=$(bzcat  $TARGET/$i | tr '>' '\n' | sed -n 's#^(DE-588)\(.*\)</sub.*#\1#p' )
	for aa in $a; do
		echo "$i has gnd id $aa"
		b=$(echo $aa | sed 's#^\(...\).*#\1#g')
		cat $SOURCE_PATH_GND/$b/$aa.nt >> $TARGET_GND
	done
done

# done with gnd already - nothing to transform and convert
cat $TARGET_GND |  hadoop dfs -put - $HDFS_FILE
# manually copy gnd resource
cat  $SOURCE_PATH_GND/170/1706733-9.nt |  hadoop dfs -put - extlod/gnd-Test/1706733-9.nt
