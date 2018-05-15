{
	jobs = 
		[
		{ name = "hello-world"
		, plan = 
		  [ 
				{ task   = "hello world"
				,	config = ./task-configs/Shell-Command 
				   { command = ''
							 echo "this is a test"
							 echo "i'm going to do a curl"
							 curl 'https://api.ipify.org?format=json'
						 ''
					 }
				}
			]
		}
	]
}
