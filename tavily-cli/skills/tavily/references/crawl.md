# tvly crawl

Crawl a site and extract content from multiple pages.

## When to use

- Bulk content from a docs section or site area
- Save pages locally with `--output-dir`

## Examples

```bash
tvly crawl "https://docs.example.com" --json
tvly crawl "https://docs.example.com" --output-dir ./docs/
tvly crawl "https://docs.example.com" --max-depth 2 --limit 50 --json
tvly crawl "https://example.com" --select-paths "/api/.*" --exclude-paths "/blog/.*" --json
tvly crawl "https://docs.example.com" --instructions "authentication" --chunks-per-source 3 --json
```

## Agent vs data collection

**Agent use** — avoid context explosion:

```bash
tvly crawl "https://docs.example.com" --instructions "API auth" --chunks-per-source 3 --json
```

**File collection** — full pages:

```bash
tvly crawl "https://docs.example.com" --max-depth 2 --output-dir ./docs/
```

## Options

| Option | Description |
|--------|-------------|
| `--max-depth` | 1–5 (default: 1) |
| `--max-breadth` | Links per page (default: 20) |
| `--limit` | Total pages (default: 50) |
| `--instructions` | Semantic focus |
| `--chunks-per-source` | 1–5 (requires `--instructions`) |
| `--extract-depth` | `basic` or `advanced` |
| `--format` | `markdown` or `text` |
| `--select-paths` / `--exclude-paths` | Path regex |
| `--select-domains` / `--exclude-domains` | Domain regex |
| `--allow-external` / `--no-external` | External links |
| `--timeout` | 10–150 seconds |
| `-o, --output` | Save JSON |
| `--output-dir` | Save each page as `.md` |
| `--json` | Structured output |

## Tips

- Start with `--max-depth 1 --limit 20`, scale up.
- Use `map` first to understand structure.
- Always set `--limit` to prevent runaway crawls.
