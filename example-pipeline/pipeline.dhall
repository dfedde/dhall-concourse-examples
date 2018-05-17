{
	jobs = 
		[
		{ name = "hello-world"
		, plan = 
		  [ 
				{ task   = "hello world"
				,	config = ./task-configs/Shell-Command ''
							 echo "this is a test"
							 echo "this is pretty cool isn't"
						 ''
				}
			]
		}
	]
}
