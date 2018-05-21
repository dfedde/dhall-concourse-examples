    let Step = ./types/plan-item 

in  let ResourceType = { name : Text }

in  let Source =
          < Git : { branch : Text, uri : Text } | Time : { interval : Text } >

in  let SourceConstuctors = constructors Source

in  let Resource = { name : Text, type : Text, source : Source }

in  let build_resource =
            λ(args : { name : Text, type : Text, source : Source })
          → { resource =
                { name = args.name, type = args.type, source = args.source }
            , get =
                  λ(config : { trigger : Bool })
                → Step.Get { get = args.name, trigger = config.trigger }
            , resource_type =
                [] : List ResourceType
            }

in  let pipeline-samples =
          build_resource
          { name =
              "pipeline-samples"
          , type =
              "git"
          , source =
              SourceConstuctors.Git
              { branch =
                  "master"
              , uri =
                  "https://github.com/pivotalservices/concourse-pipeline-samples.git"
              }
          }

in  let every-10-min =
          build_resource
          { name =
              "every-10-min"
          , type =
              "time"
          , source =
              SourceConstuctors.Time { interval = "10m" }
          }

in  let print-output =
          Step.Task
          { task =
              "do your task here"
          , config =
              ./task-configs/Shell-Command 
              ''
              echo "This job is automatically triggered upon any version change in the resource."
              ''
          }

in  { jobs =
        [ { name =
              "Run automaticlly"
          , plan =
              [ pipeline-samples.get { trigger = True }, print-output ]
          }
        , { name =
              "triggered by time"
          , plan =
              [ every-10-min.get { trigger = True }, print-output ]
          }
        ]
    , resources =
        [ pipeline-samples.resource, every-10-min.resource ]
    , resource_types =
        ([] : List ResourceType) # pipeline-samples.resource_type
    }
