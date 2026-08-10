# frontend-design-skill

**A design skill for Claude Code that refuses to show you its work until it's good.**

Every other design skill hands the model one point of view and hopes. This one adds two things nobody else does:

1. **A gate.** Eight checks, each demanding a concrete piece of evidence. One ❌ and the model shows you nothing — it goes back and fixes it first. "I used best practices" is not evidence and scores a ❌.
2. **A conductor.** It doesn't replace the good design skills that already exist. It calls them — Emil Kowalski's craft skills, Impeccable's 59 detector rules, `ui-ux-pro-max`'s 192 palettes, 21st.dev's real components — and makes them work as one toolkit instead of eight competing opinions.

The taste is borrowed on purpose, from people who are better at their one thing than any single skill could be at all of them. The gate is the part that's mine.

---

## The gate

Before the model shows you anything, it fills this table. Completely.

| # | Item | Evidence it has to produce |
|---|------|----------------------------|
| 01 | Point of view, not a template | the direction in one word + what expresses it |
| 02 | Typography works | the display+body pair (not Inter/Roboto) + the scale |
| 03 | Restrained palette | 3–5 colors listed + where each one goes |
| 04 | Hierarchy breathes | what is primary / secondary / tertiary |
| 05 | Images are meaningful | where they came from and why they fit |
| 06 | Motion whispers | the specific micro-interactions |
| 07 | Mobile is designed, not squeezed | what is solved differently than on desktop |
| 08 | The invisible is expensive | weight/speed, WCAG AA contrast, keyboard, semantics, meta |

No item can be marked N/A. Showing you the result *is* the table plus the file — not the other way around.

There's a `4/8` draft mode for when you genuinely want something rough. It only turns on if **you** say "draft" or "rough it in" — the model can't award itself the shortcut, because "this task is small" is how every shortcut starts. Accessibility and mobile-first markup never turn off, in any mode.

## What passing looks like

The shape of the last thing you see before the file — here, for a pricing page:

| # | Item | Verdict | Evidence |
|---|------|---------|----------|
| 01 | Point of view, not a template | ✅ | *Instrument.* Reads like a spec sheet, not a sales page — no testimonials, no badges, every figure monospaced |
| 02 | Typography works | ✅ | Bricolage Grotesque 600 / Instrument Sans 400, five steps at 1.25, JetBrains Mono on the numbers |
| 03 | Restrained palette | ✅ | `#0D0F14` ground, `#151922` cards, `#E6E9EE` text, `#98A0AE` secondary, `#FF4A17` on the recommended tier and nowhere else |
| 04 | Hierarchy breathes | ✅ | Recommended tier at 1.15× scale, two others equal weight, FAQ tertiary at 15px |
| 05 | Images are meaningful | ✅ | No photography — each tier gets a line diagram of what it actually connects to |
| 06 | Motion whispers | ✅ | 2px card lift over 200ms, digits cross-fade on the monthly/annual toggle, 60ms stagger on first paint |
| 07 | Mobile is designed, not squeezed | ✅ | At 375px the tiers become a scroll-snap carousel with the recommended one pre-centered, CTA sticky above the safe area |
| 08 | The invisible is expensive | ✅ | 41 KB CSS, no framework, interactive at 0.9s, 7.2:1 body / 4.8:1 accent, full keyboard path, sectioned semantics |

One ❌ in that column and you would be seeing none of it — just the model going back to work.

## Quick start

```bash
git clone https://github.com/Zealotic-spec/frontend-design-skill
cd frontend-design-skill
./install.sh                  # the skill itself
./install.sh --with-catalog   # + 11 third-party design skills, fetched from their own repos
./install.sh --list           # see exactly what that would fetch, install nothing
```

Then, in Claude Code:

```
/frontend-design-skill build the pricing page
```

Or just describe an interface — the skill triggers on its own for anything a human will look at.

Nothing is ever deleted. An already-installed skill is skipped unless you pass `--force`.

## What's inside

```
skills/frontend-design-skill/
├── SKILL.md          the gate, the orchestration, the hard bans
├── reference.md      build specifics: type, icons, images, depth, states, mobile, speed
├── react-bits.md     165 animated components, indexed by bundle weight
└── react-bits-catalog.py   regenerates that index from the live registry
```

Plus [**CATALOG.md**](CATALOG.md) — the 20 design skills worth having next to it, with their sources.

## The hard bans

Things the model is not allowed to do, ever, without you explicitly asking:

- **Zero emoji.** An emoji as an icon, navigation or decoration is the crudest possible tell. SVG only.
- **No Inter + Roboto** as the display+body pair, no `slate-*` as "a palette", no AOS fade-up, no purple→blue gradient, no glow under the button. These are the fingerprints of $200 work.
- **Not the three images all AI design collapses into:** cream + contrast serif + terracotta; near-black + acid green; newspaper grid with hairline rules. Unless the brief actually asks for one.
- **No gray placeholders, no lorem ipsum** in a final.
- **One heroic effect per screen.** Two animated backgrounds and shimmering text on top is slop, not craft.

## Why this repo exists

Good design skills are scattered across GitHub and most people never find them. `emilkowalski/skills` has 28k stars and is still the thing nobody in your feed has installed. Impeccable ships 59 deterministic detector rules that need no API key. Some of the best ones circulate as anonymous copies with the author's name stripped off.

So this repo does three jobs: ship the gate, point at the good stuff, and keep pointing at it as better stuff appears.

**It will keep being updated.** When a design skill lands that beats something in the catalog, it goes in and the weaker one comes out. Watch the repo, or check [CATALOG.md](CATALOG.md) — that's the file that moves.

## Attribution

Nothing here is a copy of someone else's skill. The catalog links to sources and `install.sh` fetches from them, so authors keep their stars, their license and their name.

Some excellent skills circulate with no author, no license and no canonical repo. They're listed under [Unattributed](CATALOG.md#unattributed) and deliberately *not* fetched. **If one of them is yours, open an issue** — it moves up into a proper section with your name on it.

## Contributing

Found a design skill that beats something in the catalog? [Open an issue](../../issues/new) with the link and one sentence on what it does better. Concrete beats enthusiastic.

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see [LICENSE](LICENSE). Applies to this repo's own contents: the skill, the reference, the catalog and the installer. Third-party skills are governed by their own licenses, listed in [CATALOG.md](CATALOG.md).

---

Built by Nurislam · [@nuriasum.md](https://instagram.com/nuriasum.md) · [@mrnurislam](https://t.me/mrnurislam)
