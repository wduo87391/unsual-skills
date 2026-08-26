# tvly search

Web search with LLM-optimized snippets and scores.

## When to use

- Find information when you don't have a URL yet
- First step before extract / map / crawl / research

## Examples

```bash
tvly search "your query" --json
tvly search "quantum computing" --depth advanced --max-results 10 --json
tvly search "AI news" --time-range week --topic news --json
tvly search "SEC filings" --include-domains sec.gov,reuters.com --json
echo "query" | tvly search - --json
```

## Options

| Option | Description |
|--------|-------------|
| `--depth` | `ultra-fast`, `fast`, `basic` (default), `advanced` |
| `--max-results` | 0–20 (default: 5) |
| `--topic` | `general`, `news`, `finance` |
| `--time-range` | `day`, `week`, `month`, `year` |
| `--start-date` / `--end-date` | `YYYY-MM-DD` |
| `--include-domains` / `--exclude-domains` | Comma-separated |
| `--country` | Boost by country |
| `--include-answer` | `basic` or `advanced` |
| `--include-raw-content` | `markdown` or `text` (large — prefer extract) |
| `--include-images` | Image results |
| `--chunks-per-source` | 1–5 (advanced/fast depth) |
| `-o, --output` | Save to file |
| `--json` | Structured output |

## Search depth

| Depth | Best for |
|-------|----------|
| `ultra-fast` | Real-time, autocomplete |
| `fast` | Need chunks, low latency |
| `basic` | General use (default) |
| `advanced` | Precision, comparisons |

## Tips

- Keep queries under 400 characters.
- Split complex topics into sub-queries.
- Use `--include-domains` for trusted sources.
- Use `--time-range` for recent news.
