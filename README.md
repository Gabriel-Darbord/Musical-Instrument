# Musical-Instrument

Instrument methods to make them play music live in Pharo.  
Musical instruments using [Phausto](https://github.com/lucretiomsp/phausto).  
Code instrumentation using [OpenTelemetry-Pharo](https://github.com/Gabriel-Darbord/opentelemetry-pharo).

## Installation

As a standalone:
```st
Metacello new
  githubUser: 'Gabriel-Darbord' project: 'Musical-Instrument' commitish: 'main' path: 'src';
  baseline: 'Musical';
  onWarning: #resume;
  load
```
As a dependency:
```st
spec baseline: 'Musical' with: [ spec repository: 'github://Gabriel-Darbord/Musical-Instrument/src' ]
```

Installing Phausto requires additional steps, see on its [wiki](https://github.com/lucretiomsp/phausto/wiki).

## Usage

To define an instrumentation that automatically makes methods musical, three components are required:

| Component | Role | Implementation |
|:---:|---|---|
| `module` | Group `instrumentation`s together. | Subclass `OTMusicalInstrumentationModule` and implement the `instrumentations` method to return those to install when the module is enabled. |
| `instrumentation` | Target methods and define the execution logic. | Subclass `OTMetaLinkInstrumentation` or `OTMethodProxyInstrumentation`, use the `OTMatcher` class-side API to implement `matching` methods, and use `instruments` to implement `evaluating` methods. |
| `instrument` | Facade for handling Phausto's lifecycle and playing sounds. | Subclass `MusicalInstrument` and implement: <ul><li>`instrument`: returns a Phausto instrument instance.</li><li>`instrumentName`: the name of the instrument registered by Phausto.</li><li>`play`: a default way to play the instrument.</li></ul> |

## Examples

See the examples in the `Musical-Example` package, loaded with:
```st
Metacello new
  githubUser: 'Gabriel-Darbord' project: 'Musical-Instrument' commitish: 'main' path: 'src';
  baseline: 'Musical';
  onWarning: #resume;
  onConflictUseLoaded;
  load: 'all'
```

It includes a module with three instrumentations:
- `OTMusicalCollections` plays a note on different methods and classes of the Collection API.
- `OTMusicalExceptions` plays a sound file when a debugger opens due to an exception.
- `OTMusicalGarbageCollector` plays a note when a global garbage collection happens.
