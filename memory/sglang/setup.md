# sglang — Setup Notes
Date: 2026-06-20

## Fork setup
- Fork URL: https://github.com/vchandela/sglang
- Local path: /Users/vivek/oss/oss-contrib-assistant/projects/sglang
- upstream remote: https://github.com/sgl-project/sglang
- Default branch: main
- origin   → vchandela/sglang  (push here; PRs come from feature branches on this fork)
- upstream → sgl-project/sglang (never push here)

## Workflow reminders
- Always branch off upstream/main: `git fetch upstream && git checkout -b <branch> upstream/main`
- Never commit to `main` on the fork — keep it a clean mirror of upstream
- Notes live here in `memory/sglang/` (committed). The clone at `projects/sglang/` is
  gitignored by the mentor repo and stays a clean mirror — nothing here can leak into a PR.

## Onboarding status
- [x] Fork + clone + upstream configured
- [ ] Architecture pass → overview.md  (run /onboard-project sgl-project/sglang)
      Use SGLang's own newcomer materials as the source: Mini-SGLang, Code Walk-through,
      GTC-2026 Training Lab (https://docs.sglang.io/docs/developer_guide/contribution_guide)
- [ ] CONTRIBUTING.md / community guidelines (Slack joined: #community, #dev, #pull-requests, #helpdesk)
- [ ] Build + test + lint commands verified locally
- [ ] PR archaeology (10 recent merged PRs)
- [ ] Unknown-unknowns checklist
- [ ] First-issue shortlist
