# Anti-slop baseline

Run `npm ci`, `npm run typecheck`, and `npm run lint`. Node 24 or newer is used in CI. The typecheck first runs `ray build` to generate Raycast's `Preferences` and `Arguments` declarations.

The unchanged source at `ddc41e9d3c2ba88461c7c3c3c6a45b1745816e44` produces 59 anti-slop errors:

- 58 `require-readable-spacing` findings across the command files and shared modules.
- One `no-unknown-parameters` finding at `src/control.ts:7` (`error`).

Raycast's original lint completes before Oxlint reports the source findings. The Raycast build and TypeScript typecheck pass. All 18 generic rules and native `oxc/no-accumulating-spread` stay enabled as errors. No direct Effect dependency is declared.

The cleanup resolves all 59 findings. Spacing fixes are separate from semantic changes. `showSpotifastError` now accepts an `Error`; catch boundaries preserve existing Error instances and turn other rejection values into an Error before reporting them. The domain-specific download action and not-running HUD remain unchanged.

`npm run lint` and `npm run typecheck` pass with all rules still enabled. No suppressions were added. Raycast's formatter and Oxlint autofix leave the cleaned source stable on a second pass.
