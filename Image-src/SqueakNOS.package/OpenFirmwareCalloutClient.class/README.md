args := OpenFirmwareCalloutClient newArgsFor: 'interpreter' inputs: 1 outputs: 0.
args at: 4 put: '." hola manola"'.
OpenFirmwareCalloutClient callout: args.
(ExternalAddress new fromInteger: args fourth / 2) stringAt: 0 size: 100
