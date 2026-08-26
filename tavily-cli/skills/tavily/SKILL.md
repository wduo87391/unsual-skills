---
name: tavily
description: |
  Web search, content extraction, site mapping, crawling, and deep research via the Tavily CLI (`tvly`). Use when the user wants to search the web, find articles, look up current information, extract content from URLs, map site structure, crawl documentation, bulk-download pages, or conduct cited research. Trigger on "search for", "find me", "look up", "extract", "fetch this page", "crawl", "download the docs", "map the site", "research", "compare X vs Y", or any task needing live web data. Do NOT use for local file ops, git, deployments, or code editing.
allowed-tools: Bash(tvly *)
---

# Tavily CLI

Web capabilities via `tvly`. Returns JSON optimized for LLM consumption.

Check auth: `tvly --status`. If missing, run `tvly login` or set `TAVILY_API_KEY`.
Run `tvly <command> --help` for full flags.

## Workflow

Escalate only when needed:

1. **search** — no URL yet; find sources
2. **extract** — have URL(s); pull content
3. **map** — large site; discover URLs first
4. **crawl** — many pages on one site
5. **research** — multi-source cited report (30–120s)

| Need | Command |
|------|---------|
| Find pages | `tvly search` |
| Page content | `tvly extract` |
| Site URLs | `tvly map` |
| Bulk pages | `tvly crawl` |
| Cited synthesis | `tvly research` |

## Quick commands

```bash
# Search
tvly search "latest nix news" --json
tvly search "AI regulation" --topic news --time-range week --json

# Extract
tvly extract "https://example.com/article" --json
tvly extract "https://docs.example.com" --query "auth API" --chunks-per-source 3 --json

# Map then extract
tvly map "https://docs.example.com" --instructions "API reference" --json
tvly extract "https://docs.example.com/api/auth" --json

# Crawl
tvly crawl "https://docs.example.com" --max-depth 2 --limit 30 --json
tvly crawl "https://docs.example.com" --output-dir ./docs/

# Research
tvly research "React vs Svelte for production" --model pro -o report.md
tvly research "AI agent frameworks" --stream
```

## Context tips

- Prefer `--json` and pipe through `jq` for structured fields only.
- Avoid `--include-raw-content` on search unless necessary — use `extract` for full pages.
- For crawls feeding an agent, use `--instructions` + `--chunks-per-source` instead of full pages.
- Quote URLs in shell; read queries from stdin with `-`.
- Exit codes: 0 ok, 2 bad input, 3 auth error, 4 API error.

## Command reference

Read only when you need detailed options:

- [search](references/search.md)
- [extract](references/extract.md)
- [map](references/map.md)
- [crawl](references/crawl.md)
- [research](references/research.md)
