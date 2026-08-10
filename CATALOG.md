# The catalog

Every design skill worth installing next to `frontend-design-skill`, with where it actually comes from.

This file is the part that keeps moving. New good design skills appear every week; when one is genuinely better than what's here, it goes in and the weak one goes out. Open an issue with a candidate.

**Attribution policy.** Nothing in this repo is a copy of someone else's skill. The catalog links to sources and [`install.sh`](install.sh) fetches from them, so authors keep their stars, their license and their name. Where a skill's original author could not be verified, it says so — see [Unattributed](#unattributed).

Legend: **auto** = installed by `install.sh` · **manual** = you install it yourself, source unverified.

---

## Craft and motion — `emilkowalski/skills`

[github.com/emilkowalski/skills](https://github.com/emilkowalski/skills) · MIT · ⭐27.8k · **auto**

Emil Kowalski is the design engineer behind [Sonner](https://sonner.emilkowal.ski) and [Vaul](https://vaul.emilkowal.ski). This is the single highest-signal source in the catalog, and eight of the skills below come from it.

| Skill | What it gives you |
|---|---|
| `emil-design-eng` | The invisible details that make software feel great — component design, animation decisions, UI polish. The one to read first. |
| `apple-design` | Apple's approach to fluid, physical motion translated to the web: gestures, springs, drag/swipe/sheets, momentum, interruptible transitions, translucency. Distilled from WWDC design talks. |
| `animation-vocabulary` | Reverse-lookup glossary: "the bouncy thing when a popover opens" → *Pop in*; "the iOS rubber-band scroll" → *Rubber-banding*. For naming an effect so you can prompt for it. |
| `find-animation-opportunities` | Scans a codebase for places that don't animate but should — and rejects everything that shouldn't. Read-only; proposes exact values. |
| `improve-animations` | Surveys all motion in a project and produces a prioritized audit plus self-contained plans a cheaper model can execute. |
| `review-animations` | Reviews animation in a diff against a high craft bar. Defaults to flagging; approval is earned. |
| `pick-ui-library` | Curated, opinionated picks for OTP inputs, charts, command menus, virtualization, drag and drop, toasts, state, styling. |
| `prototype` | Builds several genuinely different versions of one UI piece behind a visual picker, so you flip through them live and promote the one that feels right. |

## Impeccable — `pbakaus/impeccable`

[github.com/pbakaus/impeccable](https://github.com/pbakaus/impeccable) · Apache-2.0 · **auto**

| Skill | What it gives you |
|---|---|
| `impeccable` | 23 commands (`polish`, `audit`, `critique`, `distill`, `animate`, `bolder`, `quieter`…) plus 46 deterministic detector rules that run with no LLM and no API key. Started from Anthropic's `frontend-design` and went considerably further. Handles live browser iteration. |

Install its own way instead if you prefer: `npx impeccable install`, then `/impeccable init`.

## Design intelligence — `nextlevelbuilder/ui-ux-pro-max-skill`

[github.com/nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) · **auto**

| Skill | What it gives you |
|---|---|
| `ui-ux-pro-max` | A searchable database, not prose: 50+ styles, 161 color palettes, 57 font pairings, 161 product types with reasoning rules, 99 UX guidelines, 25 chart types across 10 stacks. This is where palettes and font pairs come from when the project has no brand kit. |

## Stack-specific — `mrgoonie/claudekit-skills`

[github.com/mrgoonie/claudekit-skills](https://github.com/mrgoonie/claudekit-skills) · MIT · **auto**

| Skill | What it gives you |
|---|---|
| `ui-styling` | shadcn/ui + Radix + Tailwind specifics: accessible dialogs, dropdowns, forms and tables, theming, dark mode, consistent styling patterns. Only useful on that stack — on any other, skip it. |

## Anthropic built-ins

Shipped with Claude Code, nothing to install.

| Skill | What it gives you |
|---|---|
| `frontend-design` | The original. Direction and POV, a display+body pair, one justified risk, copywriting. Enabled via the `frontend-design` plugin. |
| `dataviz` | Charts done right: form heuristic, a color formula with a runnable validator, mark specs, interaction rules. Load it **before** the first line of chart code. |
| `artifact-design` | Calibrates design investment for a published Artifact page. Mandatory before publishing one. |

---

## Unattributed

These are in wide circulation across dozens of mirror repos with no license file, no author field and no canonical upstream. They are **not** bundled here and `install.sh` will not fetch them — publishing someone's work without their name on it is not a thing this repo does.

They are listed because they are genuinely useful and because listing them is how the author gets found.

**Are you the author of one of these? [Open an issue](../../issues/new) and it moves up into a proper section with your name and your link on it.**

| Skill | Internal `name:` | What it gives you |
|---|---|---|
| `taste-skill` | `design-taste-frontend` | Anti-slop skill for landing pages, portfolios and redesigns. Reads the brief, infers the right direction, ships interfaces that don't look templated. Audit-first on redesigns. |
| `soft-skill` | `high-end-visual-design` | The exact fonts, spacing, shadows, card structures and animations that make a site feel expensive — and a block list of the defaults that make AI design look cheap. |
| `redesign-skill` | `redesign-existing-projects` | Audits an existing site, identifies generic AI patterns, applies high-end standards without breaking functionality. Framework-agnostic. |
| `minimalist-skill` | `minimalist-ui` | Clean editorial interfaces: warm monochrome, typographic contrast, flat bento grids, muted pastels. No gradients, no heavy shadows. |
| `brutalist-skill` | `industrial-brutalist-ui` | Swiss typographic print fused with military terminal: rigid grids, extreme type scale contrast, analog degradation. For dashboards and editorial sites that should feel like declassified blueprints. |
| `stitch-skill` | `stitch-design-taste` | Generates agent-friendly `DESIGN.md` files for Google Stitch — strict typography, calibrated color, asymmetric layouts. |
| `imagegen-frontend-web` | same | Image direction for premium website design references. One horizontal image per section — eight sections means eight images, never one compressed board. |
| `imagegen-frontend-mobile` | same | The same discipline for mobile: app-native screen concepts and flows, multi-screen consistency, clean phone mockup framing. |

The three style presets (`minimalist`, `brutalist`, `stitch`) each carry their own aesthetic and will fight a project's brand kit. `frontend-design-skill` never wires them up on its own — they are opt-in by name.

## Deliberately excluded

| Skill | Why |
|---|---|
| `taste-skill-v1` | Superseded by the v2 rewrite. Only install it if you need exact backward compatibility. |
| `gpt-tasteskill` | Written for GPT/Codex, not Claude. Its Python-driven randomization does not transfer. |
| `image-to-code-skill` | Same — built around Codex's image workflow. |

---

## References, not skills

| What | Where |
|---|---|
| **DESIGN.md library** — teardowns of 74 real design systems (Linear, Vercel, Stripe, Apple, Notion, Raycast, Figma, Supabase, Framer, Tesla, Nike, Spotify…). Colors, typography, layout, elevation, shapes, components, do's and don'ts, responsive behavior. | [VoltAgent/awesome-design-md](https://github.com/VoltAgent/awesome-design-md) · MIT |
| **React Bits** — 165 animated components installable through the shadcn CLI. The bundled [react-bits.md](skills/frontend-design-skill/react-bits.md) is a generated index grouped by bundle weight, so the model can pick without browsing. | [reactbits.dev](https://reactbits.dev) · MIT + Commons Clause |
| **21st.dev MCP** — real components and themes instead of invented ones. Call order matters for quota: `get_inspiration` → `search` → `get_theme` (all free) → `get_component` (metered). | [21st.dev](https://21st.dev) |
