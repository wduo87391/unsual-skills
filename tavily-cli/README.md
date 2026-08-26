# Tavily CLI + Agent Skills

Nix package for the official [Tavily CLI](https://docs.tavily.com/documentation/tavily-cli)
(`tvly`) bundled with [Tavily Agent Skills](https://docs.tavily.com/documentation/agent-skills)
from [tavily-ai/skills](https://github.com/tavily-ai/skills).

## Usage

```bash
# Authenticate (or set TAVILY_API_KEY)
tvly login --api-key tvly-YOUR_KEY
tvly --status

# Search, extract, crawl, map, research
tvly search "latest AI news" --json
tvly extract "https://example.com" --json
tvly map "https://docs.example.com" --json
tvly crawl "https://docs.example.com" --max-depth 2
tvly research "compare React vs Svelte" --model pro
```

See [Tavily CLI docs](https://docs.tavily.com/documentation/tavily-cli.md) for full
command reference.

## Skills

The package ships these skills under `$out/share/skills/`:

| Skill | Description |
| ----- | ----------- |
| `tavily-cli` | Overview and workflow for all Tavily commands |
| `tavily-search` | Web search with LLM-optimized results |
| `tavily-extract` | Extract clean content from URLs |
| `tavily-map` | Discover URLs on a website |
| `tavily-crawl` | Crawl and extract multiple pages |
| `tavily-research` | Deep multi-source research with citations |
| `tavily-best-practices` | Production integration reference |
| `tavily-dynamic-search` | Dynamic search patterns |

Install via home-manager — see the repo README.
