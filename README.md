# random-file-generator
Shell script to generate random data files of specified size and count.

## Usage
`rand-file size [count=1] [checksum=sha1sum]`

## Examples

Generate 1 file of 1024 random bytes with sha1 checksum  
`$ rand-file 1024` 

Generate 5 files of 1GB of random data each and check with sha512sum.  
`$ rand-file 1G 5 sha512sum` 

No checksum verification
`$ rand-file 1G 5 none`

 ## TODO
 - In memory checksum verification before written to file system
