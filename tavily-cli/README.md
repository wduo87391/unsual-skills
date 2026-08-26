# Tavily CLI + Agent Skill

Nix package for the official [Tavily CLI](https://docs.tavily.com/documentation/tavily-cli)
(`tvly`) with a single unified agent skill using progressive disclosure.

## Usage

```bash
tvly login --api-key tvly-YOUR_KEY   # or export TAVILY_API_KEY
tvly --status
tvly search "latest AI news" --json
tvly extract "https://example.com" --json
tvly research "compare React vs Svelte" --model pro
```

## Skill layout

One skill at `$out/share/skills/tavily/`:

| File | Purpose |
| ---- | ------- |
| `SKILL.md` | Workflow, quick commands, context tips (~80 lines) |
| `references/search.md` | Full search options (read on demand) |
| `references/extract.md` | Extract options |
| `references/map.md` | Map options |
| `references/crawl.md` | Crawl options |
| `references/research.md` | Research options |

Install via `homeModules.tavily` — see the repo README.
