if [ $# -ne 1 ]; then
 echo "Usage: `basename $0` {NewExtensionName}"
 exit 65
fi

NEWNAME=$1
NEWNAME_LOWER="`echo $NEWNAME | awk '{print tolower($0)}'`"
echo $NEWNAME_LOWER
mv ckanext/myhelper ckanext/$NEWNAME_LOWER
grep -rl Myhelper * | grep -v `basename $0` | xargs perl -pi -e "s/Myhelper/$NEWNAME/g"
grep -rl myhelper * | grep -v `basename $0` | xargs perl -pi -e "s/myhelper/$NEWNAME_LOWER/g"
cd ..
mv ckanext-myhelper ckanext-$NEWNAME_LOWER