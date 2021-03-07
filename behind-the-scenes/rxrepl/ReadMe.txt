
    RXREPL: A regular Expression Search and Replace Command Line Tool
    -----------------------------------------------------------------

    RXREPL is a command line tool to search and replace text in text 
    files using Perl compatible regular expressions (PCRE). 

    It has the following features:
        - Search using Perl Compatible Regular Expressions
        - Use group matching in replacement text
        - Supports Windows and Unix line endings
        - Unicode support
        - Accepts multiple search/replace arguments
        - Options may be provided in an options file
        - Scan for files
        - Preview mode


    PROGRAM OPTIONS

	Basic Options:
	  -h [ --help ] arg         Option help (use with "all" or "options" arguments)
	  -f [ --file ] arg         Input file (omit for console input)
	  -o [ --output ] arg       Output file (omit for console output)
	  -s [ --search ] arg       Search text as Perl compatible regular expression
	  -r [ --replace ] arg      Replacement text
	  -n [ --occurrence ] arg   Occurrence to replace
	  -i [ --ignore-case ]      Ignore case for the search
	  -c [ --case-sensitive ]   Use a case sensitive search
	  -a [ --alter ]            Alter original input file
	  -p [ --preview ]          Preview the operation of the tool
	  -P [ --preview-context ]  Show full context in preview

	File Scan Options:
	  -D [ --dir ] arg        Search directory
	  -I [ --include ] arg    Include files matching the wildcard specification
	  -X [ --ext ] arg        Output file extension
	  -R [ --recurse ]        Read all files under each directory, recursively
	  -O [ --output-dir ] arg Output directory

	Advanced Options:
	  -m [ --mode ] arg     Matching mode (line,file)
	  --eol arg             End of line sequence.
	  -e [ --encoding ] arg Input file encoding (ansi,utf8,utf16le,utf16be,auto)
	  --output-encoding arg Output file encoding (ansi,utf8,utf16le,utf16be,auto)
	  --no-backup           Supress backup of input file
	  --no-bom              Do not write unicode byte order mask (BOM)
	  --return-count        Return the number of replacements made
	  --options arg         Options file

	  Multiple search and replace arguments may be provided.
	  Use a Perl compatible regular expression (PCRE) as the search argument.
	  The replacement argument text may include:
		  - Standard escape characters ( \\ \a \b \e \f \n \r \t \u???? \x?? )
		  - Pattern group matches ( \0 \1 \2 \{10} )

    OPTIONS FILE
    
    You can provide search and replace options via an options file. 
    This allows you bypass the restrictions of the command line parser.
    
    You can include the following options in an options file:

      -s [ --search ] arg      Search text
      -r [ --replace ] arg     Replacement text
      -n [ --occurrence ] arg  Occurrence to replace
      -i [ --ignore-case ]     Ignore case for the search
      -c [ --case-sensitive ]  Use a case sensitive search

    The search and replace text may be delimited in various ways:

      --search(sample text)  -s[sample text] -s<sample text> -s{sample text}
      --replace|sample text| -r#sample text# -r~sample text~ -r:sample text:
      --search?sample text?  (where ? can be any printable character)


    LICENSE

    Author:   Ross MacGregor
    License:  Freeware, Unrestricted Use


    HISTORY

	Version 1.5: March 26, 2014
	  - Added option to disable unicode byte order mask (BOM).
	  - Depricated use of option --nobackup for new option --no-backup 

    Version 1.4: January 13, 2014
      - Added and output file encoding option.

    Version 1.3: July 10, 2013
      - Added validation for out of order progam options.

    Version 1.2: June 29, 2013
      - Fixed problems with console I/O.
      - Changed method of selecting console I/O.
      - Added preview mode.

    Version 1.1: April 3, 2013
      - Support for standard input and standard output streams
      - Multi-line matching support. New "file" mode allows multi-line matches
        but requires entire file to be read into memory so it is not as 
        efficient as "line" mode.
      - Buffered multi-line matching support not yet implemented (--mode buff).

    Version 1.0: November 12, 2012
      - Initial release
