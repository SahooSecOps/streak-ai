process=$(docker ps | grep streakai | awk '{print $1}' | wc -l)
if [ "$process" -eq 1 ]
then
	docker rm -f streakai
fi
docker run -d -p 5000:5000 --name streakai localhost:5001/streakai:r1
sleep 5
while true;
do
	process=$(docker ps  | grep streakai | awk '{print $1}' | wc -l)
	if [ "$process" -eq 1 ]
	then
		echo "service is up and running"
		break
	else
		echo "service is not running"
		count=$((count + 1))
		if [ $count -gt 10  ]
		then
			echo "not able to run container"
			break
		fi
	fi
done
num1=4
num2=5
op=$(awk "BEGIN {printf \"%.1f\", $num1 + $num2}")
echo $op
#response_code=$(timeout 10 curl -L -s -o /dev/null -w "%{http_code}" \
#	-X GET \
#	"http://localhost:5000/add?num1=$num1&num2=$num2"
#	)
res=$(curl "http://localhost:5000/add?num1=$num1&num2=$num2")
echo $res
if [ $res == $op  ];
then
	echo "api is working"
	exit 0
else
	echo "api is not working"
	exit 1
fi
echo $?
