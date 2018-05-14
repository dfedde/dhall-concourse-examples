{
	jobs = 
		[
		{ 
			name = "hello-world",
			plan = [ 
		  {
				task = "hello world",
				config = ./task-configs/Shell-Command { command = "echo 'hello world'" }
		  }
			]
		}
	]
}
