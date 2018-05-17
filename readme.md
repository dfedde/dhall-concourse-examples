Dhall and Concourse Example
---------------------------
This is an example of how Dhall can be used to make concourse pipelines easier to read understand and Dry.

See [dhall](https://github.com/dhall-lang/dhall-haskell)

### What's in this repo
```
. # <= you are here
├── docker-compose.yml     # used to get a concourse running localy
└── example-pipeline       # contains a basic pipeline using Dhall
    ├── compile            # script to compile the Dhall pipe line to yaml
    ├── pipeline.dhall     # the dhall pipeline
    ├── pipeline.yml       # the output of of compile
    └── task-configs       # dhall configs for concourse tasks
        └── Shell-Command  # A dhall file to make shell command tasks
```

### Steps to run example
1. Install ['dhall-to-json'](https://github.com/dhall-lang/dhall-json#quick-start)
1. Clone this repo `git clone https://github.com/dfedde/dhall-concourse-examples.git && cd dhall-concourse-examples`
1. Start the concourse instance `docker-compose start -d`
1. Move into the example pipeline repo `cd example-pipeline`
1. Run the compile script `./compile`
1. Read though outputted yaml
1. Set your fly target `fly -t local login -c http://127.0.0.1 -n admin`
1. Set the pipeline `fly -t local set-pipeline -c pipeline.yml -p example-pipeline`
1. Go look at your pipeline on http://127.0.0.1





