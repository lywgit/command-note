# sed

```bash
# Context: for GitLab inline math mode 
# Task: Search for \\( \\) in file.md and replace them by $` `$ 

cat file.md | sed 's/\\\\(/$`/g' | sed 's/\\\\)/`$/g' > file.md
```

## Reference
