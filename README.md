# random-file-generator
Shell script to generate random data files of specified size and count.

## Usage
`rand-file size [count=1]`

## Examples

Generate 1 file of 1024 random bytes    
`$ rand-file 1024` 

Generate 5 files of 1GB of random data each.  
`$ rand-file 1G 5` 

 ## TODO
 - In memory checksum verification before written to file system
 - Option to skip checksum verification 