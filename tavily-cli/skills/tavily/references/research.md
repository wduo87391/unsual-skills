# tvly research

Multi-source research with citations. Takes 30–120 seconds.

## When to use

- Comparisons, market analysis, literature reviews
- Need cited synthesis, not quick facts (use `search` for those)

## Examples

```bash
tvly research "competitive landscape of AI code assistants"
tvly research "EV market analysis" --model pro -o report.md
tvly research "AI agent frameworks" --stream
tvly research "topic" --json
echo "topic" | tvly research - --json
```

## Async workflow

```bash
tvly research "topic" --no-wait --json
tvly research status <request_id> --json
tvly research poll <request_id> --json -o result.json
```

## Options

| Option | Description |
|--------|-------------|
| `--model` | `mini`, `pro`, `auto` (default) |
| `--stream` | Real-time progress |
| `--no-wait` | Return `request_id` immediately |
| `--output-schema` | JSON schema path |
| `--citation-format` | `numbered`, `mla`, `apa`, `chicago` |
| `--poll-interval` | Seconds (default: 10) |
| `--timeout` | Max wait (default: 600) |
| `-o, --output` | Save report |
| `--json` | Structured output |

## Model selection

| Model | Use for |
|-------|---------|
| `mini` | Single-topic, ~30s |
| `pro` | Multi-angle analysis, ~60–120s |
| `auto` | API picks based on complexity |

Rule: "What does X do?" → mini. "X vs Y" or "best way to…" → pro.
