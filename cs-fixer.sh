#!/bin/bash


if [ -f "./vendor/bin/php-cs-fixer" ]
then
    echo "Composer OK"
else
    composer update
fi


for var in "$@"
do
    ./vendor/bin/php-cs-fixer fix $var
    ./vendor/bin/phpcbf -d --standard=PSR2 $var
    echo "CodeSniffer OK"
done
