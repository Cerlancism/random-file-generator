# random-file-generator
Shell script to generate random data files of specified size and count.

## Usage
`rand-file [-s --size 4K] [-n --number 1] [-c --checksum sha1sum]`

## Examples

Generate 1 file of 1024 random bytes with sha1 checksum  
`$ rand-file --size 1024` 

Generate 5 files of 1GB of random data each and check with sha512sum.  
`$ rand-file -s 1G -n 5 -c sha512sum` 

No checksum verification  
`$ rand-file -s 1G -n 5 -c none`

 ## TODO
 - In memory checksum verification before written to file system
 
 
 ## GPT Comments
This script is a utility that generates random files and can verify their integrity using a specified checksum function. When run, the script accepts several options and commands that control its behavior:

- The -s or --size option specifies the size of the random files to generate, in bytes. The size can be specified using the numfmt iec notation (e.g., 1K, 1M, 1G, etc.), and the default value is 4K (4 kilobytes).
- The -n or --number option specifies the number of random files to generate. The default value is 1.
- The -c or --checksum option specifies the checksum function to use to verify the generated files. The default value is sha1sum. If the value is set to none, no checksum verification will be performed.
- The -h or --help command displays a usage message and exits.
- The -v or --version command displays the version of the script and exits.
- The -d or --delete command deletes all of the previously generated random files.

The script first parses the provided options and commands to set the relevant configuration values. It then generates the specified number of random files, each with the specified size. For each file, it verifies that the actual size matches the expected size, and calculates the specified checksum for the file. The checksums for all of the files are saved to a file named checksums-${checksum}.txt, where ${checksum} is the specified checksum function.

If the none checksum function was specified, the script does not perform any verification and simply deletes the checksums-${checksum}.txt file. Otherwise, it reads the checksum file and verifies that the checksums for all of the generated files match the expected values. If any mismatches are found, the script displays an error message and exits. Otherwise, it displays a success message and exits.

Throughout the execution of the script, it displays progress messages and status updates on the console. It also includes several helper functions that are used to format and display these messages in a consistent way.


There are several ways that the script could be improved:

- The script could be made more user-friendly by providing more detailed usage information and error messages. For example, the help command could display more detailed explanations of the options and commands, and the script could display more specific error messages when invalid options or arguments are provided.
- The script could be made more efficient by improving its handling of the checksum file. Currently, the script overwrites the checksum file on each run, which means that it has to recalculate the checksums for all of the files even if they have not changed since the previous run. This can be inefficient if the same random files are generated multiple times in a row. Instead, the script could read the checksum file if it exists, and only recalculate the checksums for files that have been modified since the last run.
- The script could be made more modular and reusable by separating the different functionality into separate functions. This would make it easier to test and maintain the different parts of the script independently, and would also make it easier to reuse the script in other contexts.
- The script could be made more portable by using more portable utilities and shell syntax. Currently, the script relies on several utilities and shell features that are specific to the Bash shell, which means that it may not work on other systems or with other shells. For example, the script could be made more portable by using the sh shell instead of bash, and by using more portable command-line utilities such as awk and sed instead of Bash-specific features such as $() command substitution and process substitution.
