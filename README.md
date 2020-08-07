# random-file-generator
Shell script to generate random data files of specified size and count.

## Usage
`rand-file [-s --size 1K] [-n --number 1] [-c --checksum sha1sum]`

## Examples

Generate 1 file of 1024 random bytes with sha1 checksum  
`$ rand-file --size 1024` 

Generate 5 files of 1GB of random data each and check with sha512sum.  
`$ rand-file -s 1G -n 5 -c sha512sum` 

No checksum verification  
`$ rand-file -s 1G -n 5 -c none`

 ## TODO
 - In memory checksum verification before written to file system
