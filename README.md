Holding place for Linux scripts:
    Bourne shell (sh), Bourne-Again-Shell (bash) ... maybe others?

    1) hello.bsh
    
       Intro to Bourne-Again-Shell (.bash).  Not much different from Bourne
       Shell (.sh).
    
    2) hello_input.bsh
    
       Demo on how to prompt and take input from the user.
    
    3) find_in_archives.sh
    
       Searches archives (lib<name>.a) files for a specified string.  This
       is done to try to resolve a 'undefined symbol' during the link
       phase when building an executable.
    
       Sometimes if you're building a large program that links to
       other .a files (of object code) and you're hit with an
       "undefined symbol" error, this script will traverse directories
       that have archives and will try to find the missing symbol.  You
       then know what archive to reference in your build:
    
           -L<path> -l<name> <your-executable>
    
    4) find_in_files.sh
    
       Uses 'find' and 'grep' to recursively to do a directory
       depth-first-search to find a 'string' tag in any files
       in the directory tree.

