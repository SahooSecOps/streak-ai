process=$(docker ps | grep streakai | awk '{print $1}')
if [ "$process" -eq 1 ]
	docker rm -f streakai
fi
docker run -d -p 5000:5000 --name streakai localhost:5001/streakai:r1
while true;
do
	process=$(docker ps  | grep streakai | awk '{print $1}')
	if [ "$process" -eq 1 ]
		echo "service is up and running"
		break
	else
		echo "service is not running"
		count=$((count + 1))
		if [ $count -gt 10  ]
			echo "not able to run container"
			break
		fi
	fi
done
curl "http://localhost:5000/add?num1=3&num2=5"

