---
name: Cenové nabídky
description: Calm quotation workspace with plum atmosphere, violet actions, and pink totals.
colors:
  dark-bg: "#21182f"
  dark-fg: "#f5efff"
  dark-card: "#30253f"
  dark-field: "#3a2d4b"
  dark-border: "#5c4a70"
  dark-action: "#7953ff"
  dark-muted: "#d2c2e2"
  dark-total: "#f16adf"
  light-bg: "#faf6ff"
  light-fg: "#21172e"
  light-card: "#ffffff"
  light-field: "#fcf9ff"
  light-border: "#ded5e9"
  light-action: "#6843ed"
  light-muted: "#685a78"
  light-total: "#ab198a"
  print-fg: "#111111"
  print-muted: "#555555"
typography:
  headline:
    fontFamily: "system-ui, sans-serif"
    fontSize: "30px"
    fontWeight: 700
    lineHeight: 1.15
    letterSpacing: "-0.03em"
  title:
    fontFamily: "system-ui, sans-serif"
    fontSize: "18px"
    fontWeight: 700
    lineHeight: 1.5
  body:
    fontFamily: "system-ui, sans-serif"
    fontSize: "16px"
    fontWeight: 400
    lineHeight: 1.5
  label:
    fontFamily: "system-ui, sans-serif"
    fontSize: "13px"
    fontWeight: 400
    lineHeight: 1.5
  control:
    fontFamily: "system-ui, sans-serif"
    fontSize: "15px"
    fontWeight: 400
    lineHeight: 1.5
  total:
    fontFamily: "system-ui, sans-serif"
    fontSize: "26px"
    fontWeight: 700
    lineHeight: 1.5
rounded:
  field: "7px"
  button: "8px"
  note: "10px"
  card: "12px"
  dialog: "14px"
spacing:
  compact: "4px"
  row: "8px"
  mobile-panel: "14px"
  medium: "16px"
  card-gap: "18px"
  panel: "20px"
  workspace: "24px"
components:
  button-primary:
    backgroundColor: "{colors.light-action}"
    textColor: "{colors.light-card}"
    rounded: "{rounded.button}"
    padding: "0 14px"
  button-primary-dark:
    backgroundColor: "{colors.dark-action}"
    textColor: "{colors.light-card}"
    rounded: "{rounded.button}"
    padding: "0 14px"
  button-secondary:
    backgroundColor: "{colors.light-card}"
    textColor: "{colors.light-fg}"
    rounded: "{rounded.button}"
    padding: "0 14px"
  field:
    backgroundColor: "{colors.light-field}"
    textColor: "{colors.light-fg}"
    typography: "{typography.control}"
    rounded: "{rounded.field}"
    padding: "8px 10px"
  card:
    backgroundColor: "{colors.light-card}"
    textColor: "{colors.light-fg}"
    rounded: "{rounded.card}"
    padding: "{spacing.panel}"
  total:
    textColor: "{colors.light-total}"
    typography: "{typography.total}"
---

# Design System: Cenové nabídky

## Overview

**Creative North Star: "Approved quotation workspace"**

The approved quotation workspace combines a lighter plum canvas with blue-violet and burgundy ambient gradients. The original near-black palette was brightened at the user's request. Quiet, opaque form panels support concentrated editing; violet identifies primary actions and pink gives totals a clear visual role. The light theme preserves that relationship with pale plum surroundings and white panels.

The approved visual reference is `exec-90015145-8b52-4cca-a1a3-238a5942f2b4.png`. This document refreshes the existing approved direction from the built `theme.css`, base styles in `index.html`, and theme behavior in `workspace.js`. It records established behavior rather than introducing a new visual concept.

**Key Characteristics:**

- Plum atmosphere around quiet form panels.
- Violet primary actions and pink quotation totals.
- System typography, compact rows, and clearly aligned numeric columns.
- A right-hand desktop summary, compact mobile editing, and white A4 output.

## Colors

The palette pairs a restrained plum foundation with two functional accents. The frontmatter owns exact color values; the sidecar carries theme mappings and ambient gradients.

### Primary

- **Violet action** (`light-action`, `dark-action`): primary buttons, the current navigation step, focused controls, and button hover borders. The built CSS maps these to `--ac`.

### Secondary

- **Pink total** (`light-total`, `dark-total`): prominent quotation totals and input caret color, mapped to `--pink`.

### Neutral

- **Plum canvas** (`light-bg`, `dark-bg`): page and header foundations, mapped to `--bg`.
- **Quiet panel** (`light-card`, `dark-card`): cards, dialogs, and secondary buttons, mapped to `--card`.
- **Inset field** (`light-field`, `dark-field`): editable controls, mapped to `--field`.
- **Plum ink** (`light-fg`, `dark-fg`): primary text, mapped to `--fg`.
- **Muted lavender** (`light-muted`, `dark-muted`): explanatory copy, labels, placeholders, and status text, mapped to `--mu`.
- **Soft divider** (`light-border`, `dark-border`): panel outlines, controls, and category dividers, mapped to `--bd`.
- **Print ink** (`print-fg`, `print-muted`): dark document text and supporting print text on white paper.

**The Ambient Canvas Rule.** Keep blue-violet and burgundy gradients on the page and header; form panels stay quiet and opaque.

## Typography

Use the native system sans-serif stack throughout. The page inherits the body role; controls use the control role, and buttons increase weight to semibold (600). Monetary values use tabular numerals.

The headline role identifies editor screens; mobile headlines reduce to (26px). Panel and category headings use the title role; mobile category headings reduce to (16px). Header project names are (22px), reducing to (20px) on mobile. The login headline is an observed larger variant (36px).

Supporting editor copy is (14px), with explanatory paragraphs capped at (70ch). Column labels are (11px), reducing to (10px) on mobile. Desktop row prices are (14px), reducing to (11px) on mobile. The prominent total uses the total role; the closing summary line uses (18px). Avoid adding an unrelated display font.

## Layout

The centered workspace has a maximum width of (1280px), desktop horizontal gutters of (24px), and an editor plus right-hand summary grid. The summary column is (320px), with a (24px) gap, and stays sticky (20px) from the top. At viewport widths up to (1000px), the summary becomes (260px) with a (16px) gap.

At widths up to (719px), use one column, hide the persistent summary, and reduce page gutters to (10px). Cards use mobile-panel padding and spacing. The six navigation buttons share the available width; preserve their complete labels without a clipped or horizontally hidden final step.

Process row labels and row controls share the same grid: flexible activity name, then (104px / 70px / 100px / 32px). Up to (1000px) these columns become (85px / 60px / 80px / 30px); up to (719px), (64px / 48px / 65px / 24px). Column headings remain visible and align with type, hours/amount, and price. Fixed-item activation occupies a full-width following line. Mobile names become single-line, ellipsized buttons that open the full name editor.

Project cards use an auto-fit grid with a minimum card width of (310px), constrained to available width, and card-gap spacing. Dialogs fit within (640px) or the viewport minus (32px), have a maximum height of (85vh), and scroll internally.

Printed quotations use white A4 pages with (12mm) page margins. Hide application chrome, status, persistent summaries, and dialogs; remove page gradients and application spacing. Keep the preview/document layout separate from the editor's responsive grid. Use one row per work phase, with active activity names in parentheses and the phase total in the price column. External costs show their individual prices in the detail line, including pending amounts. Conditions use 7.5pt italic text. Long content may flow to additional pages; never crop it or force unreadable scaling.

## Elevation & Depth

Depth comes from tonal separation and fine borders. Cards and controls have no box shadows. The page's fixed ambient gradients supply atmosphere without gradients inside the editing panels. The dialog uses a dark translucent backdrop; it does not introduce a shadow vocabulary.

State changes use the existing brief border/background transitions (0.16s, CSS default easing). Focus is an action-colored (2px) outline offset by (3px). No decorative animation is established.

## Shapes

Use softly rounded cards, tighter field corners, and slightly rounder dialogs according to the frontmatter. Secondary buttons retain the established button radius. Panels and fields use fine (1px) borders. Category headers are flat, square-ended dividers with a bottom rule rather than separate colored tiles. Preserve the compact rectangular control silhouette.

## Components

### Buttons

Primary actions use the active theme's violet and white text. Secondary actions use the panel background and primary text. Standard buttons have a minimum height of (44px), horizontal padding of (14px), and semibold text. Header controls are (40px) high; small save-status actions are (32px). Hover changes the border to the action color, focus uses the shared outline, and disabled buttons reduce opacity to (0.5) with a wait cursor. No distinct active-state treatment is established.

### Cards / Containers

Cards use the active theme's opaque panel, fine border, and card radius. Desktop padding uses the panel spacing token; mobile uses mobile-panel spacing. The desktop summary shares the card language. Setup notes have the smaller note radius and muted text.

### Inputs / Fields

Inputs, selects, and textareas use the field background, fine divider border, field radius, and shared focus outline. Standard controls have a minimum height of (48px) and padding of (8px 10px). Placeholders use muted text at full opacity. Mobile process fields reduce text to (13px) and padding to (6px 2px), while full names are edited in the dialog. Validation/error states have no separate visual tokens in the current implementation; do not invent them in documentation.

### Navigation

The current step is a violet filled button with white text and `aria-current="step"`. Other steps use transparent backgrounds and borders. Desktop tabs use row spacing. Mobile tabs use equal flex widths, text at (12px), and compact horizontal padding of (3px).

### Process categories and rows

Category headers pair a disclosure marker and title with a muted filled-count label. Expanded categories show explicit column labels above their matching row grid. The activity name has priority for flexible width; prices stay right-aligned with tabular numerals. Mobile activity buttons show a shortened name and open a modal containing the full textarea and save/cancel actions.

### Quotation summary and print

The right summary uses ordinary label/value rows and a separated closing total, with the total amount in pink. Larger totals use the total typography role. Printed output uses dark ink on white and suppresses the application's decorative accents.

On the Processes screen, the introduction sits above both columns; the first category and desktop summary share the same top edge. Quotation status appears only on project cards, not in the project setup form. The status selector uses a subtle tint: lavender for draft, blue for sent, green for accepted, rose for rejected, and amber for invoiced. Keep the written status label so meaning does not depend on color.

### Theme selection

The header selector offers device preference, dark, and light modes. `qp-theme` stores the user's override; device changes update the appearance while automatic mode is selected. Theme mappings are preserved in the sidecar so future components follow both palettes.

## Do's and Don'ts

### Do:

- **Do** keep ambient gradients around opaque panels and preserve the violet-action/pink-total roles in both themes.
- **Do** align process column labels with their controls and keep every mobile navigation step visible.
- **Do** keep mobile rows compact while offering the full activity name in a dialog.
- **Do** preserve automatic theme selection, the persistent user override, and white A4 printing.

### Don't:

- **Don't** revive the discarded teal, navy, or multicolor category-header concepts.
- **Don't** add a persistent mobile summary or transfer application gradients into printed output.
- **Don't** turn illustrative reference content into a limit on the original editable fields.

