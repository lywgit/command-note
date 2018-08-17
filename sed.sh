#!/bin/bash

# search \\( \\) and replace by $` `$ for GitLab inline math mode 
cat file.md | sed 's/\\\\(/$`/g' | sed 's/\\\\)/`$/g' > file.md

