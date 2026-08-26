# tvly extract

Extract clean markdown/text from one or more URLs (max 20).

## When to use

- You have specific URL(s) and need their content
- JS-rendered pages (`--extract-depth advanced`)

## Examples

```bash
tvly extract "https://example.com/article" --json
tvly extract "https://a.com" "https://b.com" --json
tvly extract "https://docs.example.com" --query "authentication" --chunks-per-source 3 --json
tvly extract "https://app.example.com" --extract-depth advanced --json
tvly extract "https://example.com/article" -o article.md
```

## Options

| Option | Description |
|--------|-------------|
| `--query` | Rerank chunks by relevance |
| `--chunks-per-source` | 1–5 (requires `--query`) |
| `--extract-depth` | `basic` (default) or `advanced` |
| `--format` | `markdown` (default) or `text` |
| `--include-images` | Include image URLs |
| `--timeout` | 1–60 seconds |
| `-o, --output` | Save to file |
| `--json` | Structured output |

## Tips

- Try `basic` first; use `advanced` for SPAs.
- Use `--query` + `--chunks-per-source` for targeted chunks only.
- Batch large URL lists into groups of 20.
