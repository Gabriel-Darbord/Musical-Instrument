# Musical-Instrument

Instrument methods to make them play music live in Pharo.  
Musical instruments using [Phausto](https://github.com/lucretiomsp/phausto).  
Code instrumentation using [OpenTelemetry-Pharo](https://github.com/Gabriel-Darbord/opentelemetry-pharo).

## Installation

```st
Metacello new
  githubUser: 'Gabriel-Darbord' project: 'Musical-Instrument' commitish: 'main' path: 'src';
  baseline: 'Musical';
  load
```

Installing Phausto requires additional steps, see on its [wiki](https://github.com/lucretiomsp/phausto/wiki).

## Usage

### Playing Instruments

Concrete subclasses of `MusicalInstrument` each define an instrument that can play music using methods in the `playing` protocol.
By default, the `playMusicalInstrument` message is sent to the class in which the instrumented method is installed.
Re-implement this method to select which note or instrument is played by which class.

### Instrumentation

To define an instrumentation to make target methods become musical, subclass `OTMusicalInstrumentation`, and use the `OTMatcher` class-side API to implement:
- `packageMatcher` (any by default)
- `classMatcher` (any by default)
- `methodMatcher`

Redefine `onMethodEnter:` to add sampling, to decide when or what to play.
The argument is an array containing an instance of the reified message send (`RFMethodOperation`) with the method, receiver, and arguments.

## Examples

Try some of the provided instrumentations:
- **OTMusicalCollection** plays a note on `OrderedCollection >> #do:`
- **OTMusicalException** plays a sound file on a debugger that opens due to an exception.
- **OTMusicalGarbageCollector** plays a note when a global garbage collection happens.
