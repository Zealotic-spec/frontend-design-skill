# Contributing

## Adding a skill to the catalog

Open an issue with:

- the link to its **canonical** repo, not a mirror
- one sentence on what it does that nothing already in the catalog does
- its license

A skill gets in if it beats something already listed, not if it merely exists. The catalog is short on purpose — a list of forty skills is a list nobody installs.

A skill goes into the `auto` sections (and into `install.sh`) only when it has a real upstream repo with a license. Everything else lands in [Unattributed](CATALOG.md#unattributed).

## Claiming a skill

If one of the skills under **Unattributed** is yours, open an issue saying so and link the original. It moves into a proper section with your name and your repo, and `install.sh` starts fetching from you instead of telling people to find it themselves.

No proof ceremony — a link from an account that plausibly owns the work is enough. If two people claim the same skill, both get listed until it's sorted out.

## Removing a skill

If you'd rather your work not be listed here at all, open an issue and it comes out. No argument.

## Changing the skill itself

`SKILL.md` is the product, so changes to it need a reason beyond taste:

- **The gate is not negotiable.** Adding a ninth item is a discussion; making an item optional, adding an N/A escape, or letting the model self-award draft mode is not. Every one of those was already tried and every one of them turns into "I used best practices" within a week.
- **New rules need a failure they prevent.** "Don't use Inter" is in there because of what shipped before it was. If you can't name what goes wrong without your rule, it's a preference, and preferences belong in a style preset.
- **Keep it terse.** The file is loaded into a context window on every design task. A paragraph that doesn't change a decision is a paragraph that costs tokens for nothing.

Regenerate the React Bits index instead of hand-editing it:

```bash
cd skills/frontend-design-skill
curl -sfL https://reactbits.dev/r/registry.json | python3 react-bits-catalog.py > react-bits.md
```

## Testing install.sh

```bash
./install.sh --list                     # no side effects
./install.sh --dir /tmp/test-skills --with-catalog
```

`--dir` keeps your real `~/.claude/skills` untouched.
