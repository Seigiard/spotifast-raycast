# Anti-slop baseline

Run `npm ci`, `npm run typecheck`, and `npm run lint`. Node 24 or newer is used in CI. The typecheck first runs `ray build` to generate Raycast's `Preferences` and `Arguments` declarations.

The unchanged source at `ddc41e9d3c2ba88461c7c3c3c6a45b1745816e44` produces 59 anti-slop errors:

- 58 `require-readable-spacing` findings across the command files and shared modules.
- One `no-unknown-parameters` finding at `src/control.ts:7` (`error`).

Raycast's original lint completes before Oxlint reports the source findings. The Raycast build and TypeScript typecheck pass. All 18 generic rules and native `oxc/no-accumulating-spread` stay enabled as errors. No direct Effect dependency is declared.

This draft needs a separate spacing cleanup and a reviewed error-boundary contract before it can be made ready. The settings change includes no application edits or suppressions.
