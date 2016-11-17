#!/bin/bash
# Shell script. Author - XAOC

# Код города:
CITY=27786_1
DATA=$(curl -s "http://informer.gismeteo.ru/xml/$CITY.xml")
PRESSUREMAX=`echo $DATA | gawk '{print $26}' | tr -d \" | tr -d 'max='`
TEMPMAX=`echo $DATA | gawk '{print $29}' | tr -d 'max=',\"`
TEMPMIN=`echo $DATA | gawk '{print $30}' | tr -d 'min=',\","/>"`

if [[ -n $DATA ]]; then
    echo "$TEMPMAX..$TEMPMIN°C ${PRESSUREMAX}mm"
else
    echo "Проверьте подключение..."
fi
sleep 240
