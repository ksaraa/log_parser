# Log Parser

A ruby script that receives a log as argument and returns the following:
- list of webpages with most page views ordered from most pages views to less page views
- list of webpages with most unique page views also ordered

## Setup

```
bundle install
```

## Usage

```
bin/parser sample_data/webserver.log
```

## Example output:

```
*** Views ***
/about/2 90 views
/contact 89 views
/index 82 views
/about 81 views
/help_page/1 80 views
/home 78 views

*** Uniq views ***
/index 23 uniq views
/home 23 uniq views
/contact 23 uniq views
/help_page/1 23 uniq views
/about/2 22 uniq views
/about 21 uniq views
```

## Tests

```
bundle exec rspec
```

## Implementation details

`LogParser` - receives command line arguments as an argument. It validates the number of the command line arguments provided; 
if exactly one argument provided it runs the log parser, otherwise it displays a usage message

`Runner` - runs services responsible for further processing of logs

`Reader` - receives a file path as a keyword argument. Called with a proc, it reads the file line by line and calls the proc for each line

`Processor` - called with a file line as a keyword argument, it processes the line and stores path-ips pairs in a logs instance variable

`Analysers::BaseAnalyser` - an abstract class that provides template methods for Analysers::ViewsAnalyser and Analysers::UniqViewsAnalyser

`Analysers::ViewsAnalyser` - provides implementation details for analysing logs in terms of total views count. Initialized with a sorter as a keyword argument. 
It returns analysis with a title and a collection of LogEntries sorted by the provided sorter

`Analysers::UniqViewsAnalyser` - provides implementation details for analysing logs in terms of unique views count. Initialized with a sorter as a keyword argument. It returns analysis with a title and a collection of LogEntries sorted by the provided sorter

`Sorter` - receives a sort direction as a keyword argument. Called with a collection of objects to be sorted and a sort key as keyword arguments; 
it returns a collection of objects sorted according to the sort key in ascending or descending order based on the sort direction

`Formatter` - called with an analysis as a keyword argument; it displays the analysis title and data to stdout 
