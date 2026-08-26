# tvly map

Discover URLs on a site without extracting content. Faster than crawl.

## When to use

- Find the right subpage on a large site
- Understand structure before crawl or extract

## Examples

```bash
tvly map "https://docs.example.com" --json
tvly map "https://docs.example.com" --instructions "API docs" --json
tvly map "https://example.com" --select-paths "/blog/.*" --limit 500 --json
tvly map "https://example.com" --max-depth 3 --limit 200 --json
```

## Map + extract pattern

```bash
tvly map "https://docs.example.com" --instructions "authentication" --json
tvly extract "https://docs.example.com/api/authentication" --json
```

## Options

| Option | Description |
|--------|-------------|
| `--max-depth` | 1–5 (default: 1) |
| `--max-breadth` | Links per page (default: 20) |
| `--limit` | Max URLs (default: 50) |
| `--instructions` | Natural language URL filter |
| `--select-paths` / `--exclude-paths` | Regex patterns |
| `--select-domains` / `--exclude-domains` | Domain regex |
| `--allow-external` / `--no-external` | External links |
| `--timeout` | 10–150 seconds |
| `-o, --output` | Save to file |
| `--json` | Structured output |

## Tips

- Map returns URLs only — use `extract` or `crawl` for content.
- Map + extract beats full crawl when you need a few pages.
